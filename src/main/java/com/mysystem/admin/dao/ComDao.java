package com.mysystem.admin.dao;


import com.mysystem.admin.entity.MyCom;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ComDao {

	/**
	 * 模糊查询公司
	 * @param myCom 查询的名称
	 * @return
	 */
	List<MyCom> getFuzzyCom(MyCom myCom);

	MyCom selectComById(Integer comId);

	int updateCom(MyCom com);

	@Insert("INSERT INTO my_com(parent_id,com_name,address,status,email,phone)" +
			" values(#{parentId},#{comName},#{address},#{status},#{email},#{phone})")
	int insertCom(MyCom myCom);

	MyCom checkComNameUnique(@Param("comName")String comName);

	int deleteComById(Integer comId);

	/**
	 * 查询公司是否存在用户
	 *
	 * @param comId 公司ID
	 * @return 结果
	 */
	int checkComExistDept(Integer comId);
}
