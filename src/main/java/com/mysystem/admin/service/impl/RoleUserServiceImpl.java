package com.mysystem.admin.service.impl;

import com.mysystem.admin.dao.RoleUserDao;
import com.mysystem.admin.entity.MyRoleUser;
import com.mysystem.admin.service.RoleUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleUserServiceImpl implements RoleUserService {
    @Autowired
    private RoleUserDao roleUserDao;
    @Override
    public List<MyRoleUser> getMyRoleUserByUserId(Integer userId) {
       return roleUserDao.getMyRoleUserByUserId(userId);
    }
}
