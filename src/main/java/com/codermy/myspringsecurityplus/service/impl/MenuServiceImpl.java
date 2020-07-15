package com.codermy.myspringsecurityplus.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.codermy.myspringsecurityplus.dao.MenuDao;
import com.codermy.myspringsecurityplus.dto.MenuDto;
import com.codermy.myspringsecurityplus.dto.MenuIndexDto;
import com.codermy.myspringsecurityplus.entity.MyMenu;
import com.codermy.myspringsecurityplus.service.MenuService;
import com.codermy.myspringsecurityplus.utils.Result;
import com.codermy.myspringsecurityplus.utils.TreeUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author codermy
 * @createTime 2020/7/10
 */
@Service
@Slf4j
public class MenuServiceImpl implements MenuService {
    @Autowired
    private MenuDao menuDao;
    @Override
    public List<MyMenu> getMenuAll(String queryName,Integer queryType) {

        return menuDao.getFuzzyMenu(queryName,queryType);
    }

    @Override
    public MyMenu getMenuById(Integer id) {
        return menuDao.getMenuById(id);
    }

    @Override
    public List<MenuDto> buildMenuAll() {

        return menuDao.buildAll();
    }

    @Override
    public Result updateMenu(MyMenu menu) {
        return (menuDao.update(menu) > 0) ? Result.ok().message("修改成功") : Result.error().message("修改失败");

    }

    @Override
    public Result<MyMenu> save(MyMenu menu) {
        return (menuDao.save(menu) > 0) ? Result.ok().message("添加成功") : Result.error().message("添加失败");

    }

    //如果这里删除了菜单树的父节点，把它的子节点一并删除
    @Override
    public Result delete(Integer id) {
        menuDao.deleteById(id);
        menuDao.deleteByParentId(id);
        return Result.ok().message("删除成功");
    }

    @Override
    public List<MenuDto> buildMenuAllByRoleId(Integer roleId) {
        List<MenuDto> listByRoleId = menuDao.listByRoleId(roleId);
        List<MenuDto> permissionDtos = menuDao.buildAll();
        List<MenuDto> tree = TreeUtil.tree(listByRoleId, permissionDtos);
        return tree;
    }

    @Override
    public List<MenuIndexDto> getMenu(Integer userId) {
        List<MenuIndexDto> list = menuDao.listByUserId(userId);
        List<MenuIndexDto> result = TreeUtil.parseMenuTree(list);
        return result;
    }
}
