package com.mysystem.admin.service;

import com.mysystem.admin.dto.PowerDto;
import com.mysystem.admin.dto.PowerIndexDto;
import com.mysystem.admin.entity.MyPower;
import com.mysystem.common.utils.Result;

import java.util.List;


public interface PowerService {
    /**
     * 返回菜单
     * @param queryName 用户名
     * @param queryType 类型
     * @return
     */
    List<MyPower> getPowerAll(String queryName, Integer queryType);

    /**
     * 获取菜单信息
     * @param id
     * @return
     */
    MyPower getPowerById(Integer id);

    /**
     * 菜单树
     * @return
     */
    List<PowerDto> buildPowerAll();

    /**
     * 跟新菜单
     * @param power
     * @return
     */
    Result updatePower(MyPower power);

    /**
     * 保存菜单
     * @param power
     * @return
     */
    Result<MyPower> save(MyPower power);

    /**
     * 删除菜单
     * @param id
     * @return
     */
    Result delete(Integer id);

    /**
     * 通过权限id绘制菜单树
     * @param roleId
     * @return
     */
    List<PowerDto> buildPowerAllByRoleId(Integer roleId);

    /**
     * 通过用户id获取菜单
     * @param userId
     * @return
     */
    List<PowerIndexDto> getPower(Integer userId);
}
