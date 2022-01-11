package com.mysystem.admin.service;

import com.mysystem.admin.dto.RoleDto;
import com.mysystem.admin.entity.MyRole;
import com.mysystem.common.utils.Result;


public interface RoleService {
    /**
     * 返回角色
     * @param startPosition
     * @param limit
     * @param myRole
     * @return
     */
    Result<MyRole> getFuzzyRolesByPage(Integer startPosition, Integer limit,MyRole myRole);

    /**
     * 通过id获得角色信息
     * @param roleId
     * @return
     */
    MyRole getRoleById(Integer roleId);

    /**
     * 更新角色
     * @param roleDto
     * @return
     */
    Result update(RoleDto roleDto);

    /**
     * 数据权限
     * @param roleDto
     * @return
     */
    Result authDataScope(RoleDto roleDto);
    /**
     * 新建角色
     * @param roleDto
     * @return
     */
    Result save(RoleDto roleDto);

    /**
     * 删除角色
     * @param roleId
     * @return
     */
    Result<MyRole> delete(Integer roleId);

    /**
     * 获取全部角色
     * @return
     */
    Result<MyRole> getAllRoles();
}
