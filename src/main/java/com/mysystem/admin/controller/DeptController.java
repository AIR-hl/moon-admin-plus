package com.mysystem.admin.controller;

import com.alibaba.druid.sql.visitor.functions.Now;
import com.mysystem.admin.dto.DeptDto;
import com.mysystem.admin.entity.MyDept;
import com.mysystem.admin.service.ComService;
import com.mysystem.admin.service.DeptService;
import com.mysystem.admin.dto.DeptComDto;
import com.mysystem.common.utils.Result;
import com.mysystem.common.utils.ResultCode;
import com.mysystem.common.utils.UserConstants;
import com.mysystem.log.aop.MyLog;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("/api/dept")
@Api(tags = "系统：部门管理")
public class DeptController {

    @Autowired
    private DeptService deptService;

    @Autowired
    private ComService comService;

    @GetMapping("index")
    @ApiOperation(value = "返回部门页面")
    public String index(){
        return "system/dept/dept";
    }

    @GetMapping
    @ResponseBody
    @ApiOperation(value = "部门列表")
    @PreAuthorize("hasAnyAuthority('dept:add','dept:edit')")
    @MyLog("查询部门")
    public Result getDeptAll(DeptComDto myDept){

        List<DeptComDto> list =deptService.getDeptAll(myDept);
        return Result.ok().data(list).code(ResultCode.TABLE_SUCCESS);
    }

    @GetMapping("query")
    @ResponseBody
    @ApiOperation(value = "部门查询")
    @PreAuthorize("hasAnyAuthority('dept:add','dept:edit')")
    @MyLog("查询部门")
    public Result getFuzzyDept(String comName){

        List<DeptComDto> list =deptService.getFuzzyDept(comName);
        return Result.ok().data(list).code(ResultCode.TABLE_SUCCESS);
    }

    @GetMapping("build")
    @ResponseBody
    @ApiOperation(value = "绘制部门树")
    @PreAuthorize("hasAnyAuthority('dept:add','dept:edit','user:list')")
    @MyLog("绘制部门树")
    public Result buildDeptAll(DeptComDto myDept){
        List<DeptComDto> deptAll =deptService.getDeptAll(myDept);
        return Result.ok().data(deptAll);
    }

    @GetMapping("build_userAdd")
    @ResponseBody
    @ApiOperation(value = "绘制添加用户时的部门树")
    @PreAuthorize("hasAnyAuthority('dept:add','dept:edit')")
    @MyLog("绘制部门增加树")
    public Result buildDeptWithoutCom(DeptComDto myDept){
        List<DeptComDto> deptAll =deptService.getDeptAll(myDept);
        for(DeptComDto d:deptAll){
            if(deptService.selectDeptById(d.getDeptId())!=null){
                d.setDisabled(false);
            }else{
                d.setDisabled(true);
            }
        }
        return Result.ok().data(deptAll);
    }

    @GetMapping("/add")
    @ApiOperation(value = "添加部门页面")
    @PreAuthorize("hasAnyAuthority('dept:add')")
    public String addJob(Model model){
        model.addAttribute("myDept",new MyDept());
        return "/system/dept/dept-add";
    }

    @PostMapping
    @ResponseBody
    @ApiOperation(value = "添加部门")
    @PreAuthorize("hasAnyAuthority('dept:add')")
    @MyLog("添加部门")
    public Result<MyDept> savePermission(@RequestBody MyDept dept) {
        if (deptService.checkDeptNameUnique(dept)!="0") {
            return Result.error().message("新增部门失败，部门名称已存在");
        }
        int i = deptService.insertDept(dept);
        return Result.judge(i,"添加");
    }

    @GetMapping(value = "/edit")
    @ApiOperation(value = "修改部门页面")
    @PreAuthorize("hasAnyAuthority('dept:edit')")
    public String editPermission(Model model, MyDept dept) {
        if(deptService.selectDeptById(dept.getDeptId())!=null){
            model.addAttribute("myDept",deptService.selectDeptById(dept.getDeptId()));
            return "system/dept/dept-edit";
        }else{
            model.addAttribute("myCom",comService.selectComById(dept.getDeptId()));
            return "system/com/com-edit";
        }
    }

    @PutMapping
    @ResponseBody
    @ApiOperation(value = "修改部门")
    @PreAuthorize("hasAnyAuthority('dept:edit')")
    @MyLog("修改部门")
    public Result updateMenu(@RequestBody MyDept dept) {
        if(deptService.selectDeptById(dept.getDeptId())!=null){
            if (UserConstants.DEPT_NAME_NOT_UNIQUE.equals( deptService.checkDeptNameUnique(dept))) {
                return Result.error().message("更新失败，部门名称已存在");
            }
            int i = deptService.updateDept(dept);
            return Result.judge(i,"修改部门");
        }else{
            dept.setParentId(0);
            int i = comService.updateCom(dept);
            return Result.judge(i,"修改公司");
        }
    }

    /**
     * 用户状态修改
     */
    @MyLog("修改部门状态")
    @PutMapping("/changeStatus")
    @ResponseBody
    @ApiOperation(value = "修改部门状态")
    @PreAuthorize("hasAnyAuthority('dept:edit')")
    public Result changeStatus(@RequestBody MyDept myDept)
    {
        return Result.judge(deptService.changeStatus(myDept),"修改");
    }

    @DeleteMapping
    @ResponseBody
    @ApiOperation(value = "删除部门")
    @PreAuthorize("hasAnyAuthority('dept:del')")
    @MyLog("删除部门")
    public Result<MyDept> deleteDept(Integer deptId) {
/*        if (deptService.selectDeptCount(deptId) > 0){
            return Result.error().message("存在下级部门,不允许删除");
        }*/
        if(deptService.selectDeptById(deptId)==null){
            if (comService.checkComExistDept(deptId))
            {
                return Result.error().message("公司存在部门,不允许删除");
            }
            int i = comService.deleteComById(deptId);
            return Result.judge(i,"删除公司");
        }
        if (deptService.checkDeptExistUser(deptId))
        {
            return Result.error().message("部门存在用户,不允许删除");
        }
        int i = deptService.deleteDeptById(deptId);
        return Result.judge(i,"删除部门");
    }

    /**
     * 加载角色部门（数据权限）列表树
     */
    @GetMapping("/ebuild/{roleId}")
    @ResponseBody
    @ApiOperation(value = "通过id绘制部门树")
    @PreAuthorize("hasAnyAuthority('role:add','role:edit')")
    @MyLog("通过id绘制部门树")
    public Result deptTreeData(@PathVariable Integer roleId)
    {
        List<DeptDto> deptDtos = deptService.roleDeptTreeData(roleId);
        return Result.ok().data(deptDtos);
    }

}