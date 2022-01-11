package com.mysystem.admin.dao;

import com.mysystem.admin.dto.PowerDto;
import com.mysystem.admin.dto.PowerIndexDto;
import com.mysystem.admin.entity.MyPower;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * @author codermy
 * @createTime 2020/7/10
 */
@SuppressWarnings("ALL")
@Mapper
public interface PowerDao {
    /**
     * 模糊查询菜单
     * @param queryName 查询的表题
     * @param queryType 查询类型
     * @return
     */
    @SuppressWarnings("AlibabaAbstractMethodOrInterfaceMethodMustUseJavadoc")
    List<MyPower> getFuzzyPower(String queryName, Integer queryType);

    /**
     * 通过id查询菜单
     * @param powerId
     * @return
     */
    @Select("select m.power_id,m.parent_id,m.power_name,m.icon,m.url,m.permission,m.sort,m.type,m.create_time,m.update_time from my_power m where m.power_id = #{powerId}")
	MyPower getPowerById(Integer powerId);

    /**
     * 菜单树
     * @return
     */
    @Select("select m.power_id,m.parent_id,m.power_name from my_power m")
    @Result(property = "title",column = "power_name")
    @Result(property = "id",column = "power_id")
    List<PowerDto> buildAll();

    /**
     * 更新菜单
     * @param power
     * @return
     */
    int update(MyPower power);

    /**
     * 新建菜单
     * @param power
     * @return
     */
    @Options(useGeneratedKeys = true, keyProperty = "powerId")
    @Insert("insert into my_power(parent_id, power_name, " +
            "icon, url, permission, sort, type)" +
            "values(#{parentId}, #{powerName}, #{icon}, #{url}, #{permission}, #{sort}, #{type})")
    int save(MyPower power);

    /**
     * 通过id删除菜单
     * @param powerId
     * @return
     */
    @Delete("delete from my_power where power_id = #{powerId}")
    int deleteById(Integer powerId);

    /**
     * 通过父节点删除子菜单
     * @param parentId
     * @return
     */
    @Delete("delete from my_power where parent_id = #{parentId}")
    int deleteByParentId(Integer parentId);

    /**
     * 通过父节点返回字节点
     * @param parentId
     * @return
     */
    @Select("select m.power_id from my_power m where parent_id = #{parentId}")
    List<Integer> selectByParentId(Integer parentId);

    /**
     * 通过角色id返回菜单
     * @param roleId
     * @return
     */
    @Select("select m.power_id,m.parent_id,m.power_name " +
            "from my_power m inner join my_role_power rm on m.power_id = rm.power_id" +
            " where rm.role_id = #{roleId}")
    @Result(property = "title",column = "power_name")
    @Result(property = "id",column = "power_id")
    List<PowerDto> listByRoleId(Integer roleId);

    /**
     * 通过用户id返回菜单
     * @param userId
     * @return
     */
    List<PowerIndexDto> listByUserId(@Param("userId")Integer userId);
}
