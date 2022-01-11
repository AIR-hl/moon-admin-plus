package com.mysystem.admin.controller;


import com.mysystem.admin.entity.MyCom;
import com.mysystem.admin.entity.MyDept;
import com.mysystem.admin.service.ComService;
import com.mysystem.common.utils.Result;
import com.mysystem.common.utils.UserConstants;
import com.mysystem.log.aop.MyLog;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/api/com")
@Api(tags = "系统：公司管理")
public class ComController {
	@Resource
	private ComService comService;


	@GetMapping("/add")
	@ApiOperation(value = "添加公司页面")
	@PreAuthorize("hasAnyAuthority('dept:add')")
	public String addJob(Model model){
		model.addAttribute("myDept",new MyDept());
		return "/system/com/com-add";
	}

	@GetMapping("build")
	@ResponseBody
	@ApiOperation(value = "绘制公司树")
	@PreAuthorize("hasAnyAuthority('dept:add','dept:edit')")
	@MyLog("绘制公司树")
	public Result buildDeptAll(MyCom myCom){
		List<MyCom> allCom =comService.getComAll(myCom);
		return Result.ok().data(allCom);
	}

	@PostMapping
	@ResponseBody
	@ApiOperation(value = "添加公司")
	@PreAuthorize("hasAnyAuthority('dept:add')")
	@MyLog("添加公司")
	public Result<MyCom> savePermission(@RequestBody MyCom myCom) {

		if (UserConstants.DEPT_NAME_NOT_UNIQUE.equals( comService.checkComNameUnique(myCom))) {
			return Result.error().message("新增公司'" + myCom.getComName() + "'失败，公司名称已存在");
		}
		int i = comService.insertCom(myCom);
		return Result.judge(i,"添加");
	}
}
