package com.mysystem.admin.dao;

import com.mysystem.admin.dto.JobDto;
import com.mysystem.admin.dto.JobQueryDto;
import com.mysystem.admin.entity.MyJob;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author codermy
 * @createTime 2020/8/19
 */
@Mapper
public interface JobDao {
    /**
     * @param jobQueryDto
     * @return
     */
    List<JobDto> getFuzzyJob(JobQueryDto jobQueryDto);

    /**
     * 新增岗位信息
     * @param job 岗位信息
     * @return 结果
     */
    @Insert("INSERT INTO my_job(job_name,status,grade)" +
            " values(#{jobName},#{status},#{grade})")
    int insertDept(MyJob job);


    /**
     * 校验岗位名称
     * @param name 岗位名称
     * @return 结果
     */
    MyJob checkJobNameUnique(String name);
    /**
     * 通过id查询岗位信息
     * @param jobId
     * @return
     */
    @Select("select j.job_id,j.job_name,j.status,j.grade" +
            " from my_job j" +
            " where j.job_id = #{jobId}")
    MyJob getJobById(Integer jobId);

    /**
     * 批量删除岗位信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    int deleteJobByIds(Integer[] ids);

    /**
     * 根据用户ID查询岗位
     *
     * @param userId 用户ID
     * @return 岗位列表
     */
    List<MyJob> selectJobsByUserId(Integer userId);

    /**
     * 查询所有岗位
     *
     * @return 岗位列表
     */
    List<MyJob> selectJobAll();

    /**
     * 修改岗位信息
     *
     * @param myJob 岗位信息
     * @return 结果
     */
    int updateJob(MyJob myJob);
}
