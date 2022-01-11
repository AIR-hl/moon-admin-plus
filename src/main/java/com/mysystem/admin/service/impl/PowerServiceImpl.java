package com.mysystem.admin.service.impl;

import com.mysystem.admin.dao.PowerDao;
import com.mysystem.admin.dao.RolePowerDao;
import com.mysystem.admin.dto.PowerDto;
import com.mysystem.admin.dto.PowerIndexDto;
import com.mysystem.admin.entity.MyPower;
import com.mysystem.admin.service.PowerService;
import com.mysystem.common.utils.Result;
import com.mysystem.common.utils.TreeUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@Slf4j
public class PowerServiceImpl implements PowerService {
    @Autowired
    private PowerDao powerDao;
    @Autowired
    private RolePowerDao rolePowerDao;

    @Override
    public List<MyPower> getPowerAll(String queryName, Integer queryType) {

        return powerDao.getFuzzyPower(queryName,queryType);
    }

    @Override
    public MyPower getPowerById(Integer id) {
        return powerDao.getPowerById(id);
    }

    @Override
    public List<PowerDto> buildPowerAll() {
        return powerDao.buildAll();
    }

    @Override
    public Result updatePower(MyPower power) {
        power.setIcon("layui-icon "+power.getIcon());
        return (powerDao.update(power) > 0) ? Result.ok().message("修改成功") : Result.error().message("修改失败");

    }

    @Override
    public Result<MyPower> save(MyPower power) {
        power.setIcon("layui-icon "+power.getIcon());
        return (powerDao.save(power) > 0) ? Result.ok().message("添加成功") : Result.error().message("添加失败");

    }

    /**
     * 如果这里删除了菜单树的父节点，把它的子节点一并删除
     * @param id
     * @return
     */
    @Override
    public Result delete(Integer id) {
        Integer count = rolePowerDao.countRolePowerByRoleId(id);
        if (count == 0){
            powerDao.deleteById(id);
            List<Integer> list = powerDao.selectByParentId(id);
            if(list.size()>0){
                for (Integer parentId: list){
                    powerDao.deleteByParentId(parentId);
                }
                powerDao.deleteByParentId(id);
            }
            return Result.ok().message("删除成功");
        }
        else {
            return Result.error().message("已经有角色分配该菜单，无法删除");
        }

    }

    @Override
    public List<PowerDto> buildPowerAllByRoleId(Integer roleId) {
        List<PowerDto> listByRoleId = powerDao.listByRoleId(roleId);
        List<PowerDto> permissionDtos = powerDao.buildAll();
        List<PowerDto> tree = TreeUtil.powertree(listByRoleId, permissionDtos);
        return tree;
    }

    @Override
    public List<PowerIndexDto> getPower(Integer userId) {
        List<PowerIndexDto> list = powerDao.listByUserId(userId);
        List<PowerIndexDto> result = TreeUtil.parsePowerTree(list);
        return result;
    }
}
