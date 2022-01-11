package com.mysystem.admin.controller;

import com.mysystem.admin.dto.PowerDto;
import com.mysystem.admin.entity.MyPower;
import com.mysystem.log.aop.MyLog;
import com.mysystem.admin.service.PowerService;
import com.mysystem.common.utils.Result;
import com.mysystem.common.utils.ResultCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/api/power")
@Api(tags = "系统：菜单管理")
public class PowerController {
    @Autowired
    private PowerService powerService;

    @GetMapping("index")
    @PreAuthorize("hasAnyAuthority('power:list')")
    @ApiOperation(value = "返回菜单页面")
    public String index(){
        return "system/power/power";
    }


    @GetMapping
    @ResponseBody
    @ApiOperation(value = "菜单列表")
    @PreAuthorize("hasAnyAuthority('power:list')")
    @MyLog("查询菜单")
    public Result getPowerAll(String queryName,Integer queryType){
        return Result.ok().data(powerService.getPowerAll(queryName,queryType)).code(ResultCode.TABLE_SUCCESS);
    }

    @GetMapping("/build")
    @ResponseBody
    @ApiOperation(value = "绘制菜单树")
    @PreAuthorize("hasAnyAuthority('power:add','power:edit')")
    @MyLog("绘制菜单树")
    public Result buildPowerAll(){
        List<PowerDto> powerAll = powerService.buildPowerAll();
        return Result.ok().data(powerAll);
    }

    @GetMapping("/ebuild/{roleId}")
    @ResponseBody
    @ApiOperation(value = "通过id绘制菜单树")
    @PreAuthorize("hasAnyAuthority('role:add','role:edit')")
    @MyLog("通过id绘制菜单树")
    public Result buildPowerAllByRoleId(@PathVariable Integer roleId){
        List<PowerDto> powerAll = powerService.buildPowerAllByRoleId(roleId);
        return Result.ok().data(powerAll);
    }

    @GetMapping(value = "/edit")
    @ApiOperation(value = "修改菜单页面")
    @PreAuthorize("hasAnyAuthority('power:edit')")
    public String editPermission(Model model, MyPower myPower) {
        model.addAttribute("myPower", powerService.getPowerById(myPower.getPowerId()));
        return "system/power/power-edit";
    }

    @PutMapping
    @ResponseBody
    @ApiOperation(value = "修改菜单")
    @PreAuthorize("hasAnyAuthority('power:edit')")
    @MyLog("修改菜单")
    public Result updatePower(@RequestBody MyPower power) {
        return powerService.updatePower(power);
    }


    @GetMapping(value = "/add")
    @ApiOperation(value = "添加菜单页面")
    @PreAuthorize("hasAnyAuthority('power:add')")
    public String addPower(Model model) {
        model.addAttribute("myPower",new MyPower());
        return "system/power/power-add";
    }

    @PostMapping
    @ResponseBody
    @ApiOperation(value = "添加菜单")
    @PreAuthorize("hasAnyAuthority('power:add')")
    @MyLog("添加菜单")
    public Result<MyPower> savePermission(@RequestBody MyPower myPower) {
        return powerService.save(myPower);
    }


    /**
     * @param powerId
     * @return
     */
    @DeleteMapping
    @ResponseBody
    @ApiOperation(value = "删除菜单")
    @PreAuthorize("hasAnyAuthority('power:del')")
    @MyLog("删除菜单")
    public Result deletePower(Integer powerId) {
        return powerService.delete(powerId);
    }

}
