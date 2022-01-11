package com.mysystem.admin.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.mysystem.admin.annotation.DataPermission;
import com.mysystem.admin.dao.ComDao;
import com.mysystem.admin.dao.DeptDao;
import com.mysystem.admin.dto.DeptDto;
import com.mysystem.admin.entity.MyCom;
import com.mysystem.admin.entity.MyDept;
import com.mysystem.admin.service.DeptService;
import com.mysystem.admin.dto.DeptComDto;
import com.mysystem.common.utils.TreeUtil;
import com.mysystem.common.utils.UserConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptDao deptDao;

    @Autowired
    private ComDao comDao;

    @Override
    @DataPermission(deptAlias = "d")
    public List<DeptComDto> getDeptAll(DeptComDto myDept) {
        return deptDao.getDeptAll(myDept);
    }

    @Override
    @DataPermission(deptAlias = "d")
    public List<DeptComDto> getFuzzyDept(String comName) {
        return deptDao.getFuzzyDept(comName);
    }


    @Override
    @DataPermission(deptAlias = "d")
    public List<DeptDto> roleDeptTreeData(Integer roleId) {
        List<DeptDto> selectRoleDeptTree = deptDao.selectRoleDeptTree(roleId);
        DeptDto deptDto = new DeptDto();
        List<DeptDto> buildAll = deptDao.buildAll(deptDto);
        List<DeptDto> tree = TreeUtil.deptTree(selectRoleDeptTree, buildAll);
        return tree;
    }

    @Override
    public int insertDept(MyDept dept) {
        MyDept info = deptDao.selectDeptById(dept.getParentId());
        return deptDao.insertDept(dept);
    }

    @Override
    public String checkDeptNameUnique(MyDept dept) {
        MyDept info = deptDao.checkDeptNameUnique(dept);
        if (ObjectUtil.isNotEmpty(info) && !info.getDeptId().equals(dept.getDeptId())){
            return UserConstants.DEPT_NAME_NOT_UNIQUE;
        }
        return UserConstants.DEPT_NAME_UNIQUE;
    }

    @Override
    public MyDept selectDeptById(Integer deptId) {
        return deptDao.selectDeptById(deptId);
    }

    @Override
    public int updateDept(MyDept dept) {
        MyDept parentInfo = deptDao.selectDeptById(dept.getParentId());
        MyDept oldInfo = selectDeptById(dept.getDeptId());

        int result =deptDao.updateDept(dept);
        if (UserConstants.DEPT_NORMAL.equals(dept.getStatus().toString()))
        {
            // 如果该部门是启用状态，则启用该部门的所有上级部门
            updateParentDeptStatus(dept);
        }
        return result;
    }

    @Override
    public int selectNormalChildrenDeptById(Integer deptId) {
        return deptDao.selectNormalChildrenDeptById(deptId);
    }

    @Override
    public int selectDeptCount(Integer parentId) {
        MyDept dept =new MyDept();
        dept.setParentId(parentId);
        return deptDao.selectDeptCount(dept);
    }

    @Override
    public boolean checkDeptExistUser(Integer deptId) {
        int result = deptDao.checkDeptExistUser(deptId);
        return result > 0 ? true : false;
    }

    @Override
    public int deleteDeptById(Integer deptId) {
        return deptDao.deleteDeptById(deptId);
    }

    @Override
    public int changeStatus(MyDept myDept) {
        int result = 0;
        Integer id=myDept.getDeptId();
        if(deptDao.selectDeptById(id)!=null){
            MyDept tempDept =deptDao.selectDeptById(id);
            if(tempDept.getStatus()==0){
                tempDept.setStatus(1);
            }else{
                tempDept.setStatus(0);
            }
            result = deptDao.updateDept(tempDept);
        }else{
            MyCom tempCom = comDao.selectComById(id);
            if(tempCom.getStatus()==0){
                tempCom.setStatus(1);
            }else{
                tempCom.setStatus(0);
            }
            result = comDao.updateCom(tempCom);
        }
        return result;
    }

    /**
     * 修改子元素关系
     *
     * @param id 被修改的部门ID
     * @param newAncestors 新的父ID集合
     * @param oldAncestors 旧的父ID集合
     */
    public void updateDeptChildren(Integer id, String newAncestors, String oldAncestors)
    {
        List<MyDept> children = deptDao.selectChildrenDeptById(id);

        if (children.size() > 0)
        {
            deptDao.updateDeptChildren(children);
        }
    }

    /**
     * 修改该部门的父级部门状态
     *
     * @param dept 当前部门
     */
    private void updateParentDeptStatus(MyDept dept)
    {
        dept = deptDao.selectDeptById(dept.getDeptId());;
        deptDao.updateDeptStatus(dept);
    }
}
