package com.mysystem.admin.service;

import com.mysystem.admin.entity.MyCom;
import com.mysystem.admin.entity.MyDept;

import java.util.List;

public interface ComService {

	String checkComNameUnique(MyCom myCom);


	/**
	 * 新增部门信息
	 * @param myCom 岗位信息
	 * @return 结果
	 */
	int insertCom(MyCom myCom);

	/**
	 * 返回公司
	 * @param myCom 名称
	 * @return
	 */
	List<MyCom> getComAll(MyCom myCom);

	/**
	 * 修改保存公司信息
	 *
	 * @param com 公司信息
	 * @return 结果
	 */
	int updateCom(MyDept com);

	/**
	 * 删除部门管理信息
	 *
	 * @param comId 公司ID
	 * @return 结果
	 */
	int deleteComById(Integer comId);

	/**
	 * 查询公司是否存在部门
	 *
	 * @param comId 公司ID
	 * @return 结果 true 存在 false 不存在
	 */
	boolean checkComExistDept(Integer comId);


	/**
	 * 根据公司ID查询信息
	 *
	 * @param comId 公司ID
	 * @return 公司信息
	 */
	MyCom selectComById(Integer comId);
}
