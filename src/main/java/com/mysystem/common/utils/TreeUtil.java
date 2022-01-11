package com.mysystem.common.utils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.mysystem.admin.dto.DeptDto;
import com.mysystem.admin.dto.PowerDto;
import com.mysystem.admin.dto.PowerIndexDto;

import java.util.*;
import java.util.stream.Collectors;


public class TreeUtil {
    //todo 判断list是否为空

    /**
     *
     * @param listByRoleId 通过角色id查询的powerid
     * @param powerDtos 返回的powertree
     * @return
     */
    public static List<PowerDto> powertree(List<PowerDto> listByRoleId, List<PowerDto> powerDtos ){

        List<Integer> collect = listByRoleId.stream().map(PowerDto ::getId).collect(Collectors.toList());
        List<Integer> collect1 = powerDtos.stream().map(PowerDto ::getId).collect(Collectors.toList());
        // 遍历list2
        for (Integer item : collect) {
            // 如果存在这个数
            if (collect1.contains(item)) {
                PowerDto powerDto = new PowerDto();
                int i = collect1.indexOf(item);
                powerDto = powerDtos.get(i);
                powerDto.setCheckArr("1");
                powerDtos.set(i,powerDto);
            }
        }
        return powerDtos;
    }

    public static List<DeptDto> deptTree(List<DeptDto> listById, List<DeptDto> lists ){

        List<Integer> collect = listById.stream().map(DeptDto::getId).collect(Collectors.toList());
        List<Integer> collect1 = lists.stream().map(DeptDto::getId).collect(Collectors.toList());
        // 遍历list2
        for (Integer item : collect) {
            // 如果存在这个数
            if (collect1.contains(item)) {
                DeptDto deptDto = new DeptDto();
                int i = collect1.indexOf(item);
                deptDto = lists.get(i);
                deptDto.setCheckArr("1");
                lists.set(i,deptDto);
            }
        }
        return lists;
    }

    public static void setPowerTree(Integer parentId, List<PowerIndexDto> powersAll, JSONArray array) {
        for (PowerIndexDto per : powersAll) {
            if (per.getParentId().equals(parentId)) {
                String string = JSONObject.toJSONString(per);
                JSONObject parent = (JSONObject) JSONObject.parse(string);
                array.add(parent);
                if (powersAll.stream().filter(p -> p.getParentId().equals(per.getId())).findAny() != null) {
                    JSONArray child = new JSONArray();
                    parent.put("child", child);
                    setPowerTree(per.getId(), powersAll, child);
                }
            }
        }
    }

    public static List<PowerIndexDto> parsePowerTree(List<PowerIndexDto> list){
        List<PowerIndexDto> result = new ArrayList<PowerIndexDto>();
        // 1、获取第一级节点
        for (PowerIndexDto power : list) {
            if(power.getParentId() == 0) {
                result.add(power);
            }
        }
        // 2、递归获取子节点
        for (PowerIndexDto parent : result) {
            parent = recursiveTree(parent, list);
        }
        return result;
    }

    public static PowerIndexDto recursiveTree(PowerIndexDto parent, List<PowerIndexDto> list) {
        List<PowerIndexDto>children = new ArrayList<>();
        for (PowerIndexDto power : list) {
            if (Objects.equals(parent.getId(), power.getParentId())) {
                children.add(power);
            }
            parent.setChildren(children);
        }
        return parent;
    }
}
