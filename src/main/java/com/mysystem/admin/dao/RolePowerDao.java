package com.mysystem.admin.dao;

import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author codermy
 * @createTime 2020/7/10
 */
@Mapper
public interface RolePowerDao {
    /**
     * 通过id删除rolepower
     * @param roleId
     * @return
     */
    @Delete("delete from my_role_power where role_id = #{roleId}")
    int deleteRolePower(Integer roleId);

    /**
     * 新建角色与power的联系
     * @param roleId
     * @param powerIds
     */
    void save(@Param("roleId")Integer roleId,@Param("powerIds") List<Integer> powerIds);

    /**
     * 通过role_id计算权限数量
     * @param id
     * @return
     */
    @Select("select count(*) from my_role_power t where t.power_id = #{powerId}")
    Integer countRolePowerByRoleId(Integer id);
}
