package com.mysystem.admin.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.mysystem.admin.annotation.DataPermission;
import com.mysystem.admin.dao.ComDao;
import com.mysystem.admin.dao.DeptDao;
import com.mysystem.admin.entity.MyCom;
import com.mysystem.admin.entity.MyDept;
import com.mysystem.admin.service.ComService;
import com.mysystem.common.utils.UserConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ComServiceImpl implements ComService {

	@Autowired
	private ComDao comDao;

	@Autowired
	private DeptDao deptDao;

	@Override
	@DataPermission( deptAlias = "d" )
	public List<MyCom> getComAll(MyCom myCom) {
		return comDao.getFuzzyCom(myCom);
	}

	@Override
	public String checkComNameUnique(MyCom myCom) {
		MyCom info = comDao.checkComNameUnique(myCom.getComName());
		if (ObjectUtil.isNotEmpty(info) && !info.getComId().equals(myCom.getComId())) {
			return UserConstants.DEPT_NAME_NOT_UNIQUE;
		}
		return UserConstants.DEPT_NAME_UNIQUE;
	}

	@Override
	public int insertCom(MyCom myCom) {
		myCom.setParentId(0);
		return comDao.insertCom(myCom);
	}


	@Override
	public int updateCom(MyDept dept) {
		MyCom myCom = new MyCom();
		myCom.setComId(dept.getDeptId());
		myCom.setParentId(dept.getParentId());
		myCom.setStatus(dept.getStatus());
		myCom.setPhone(dept.getPhone());
		myCom.setComName(dept.getDeptName());
		myCom.setEmail(dept.getEmail());
		myCom.setAddress(dept.getAddress());
		int result = comDao.updateCom(myCom);
		return result;

	}

	@Override
	public int deleteComById(Integer comId) {
		return comDao.deleteComById(comId);
	}

	/**
	 * 查询公司是否存在部门
	 *
	 * @param deptId 部门ID
	 * @return 结果 true 存在 false 不存在
	 */
	public boolean checkComExistDept(Integer deptId){
		int result = comDao.checkComExistDept(deptId);
		return result > 0 ? true : false;
	}


	@Override
	public MyCom selectComById(Integer comId) {
		return comDao.selectComById(comId);
	}
}
