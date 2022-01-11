package com.mysystem.admin.dto;


import com.mysystem.admin.entity.BaseEntity;
import lombok.Data;

@Data
public class JobDto extends BaseEntity {
	private static final long serialVersionUID = 8925514045582234222L;

	private Integer jobId;

	private String jobName;

	private Integer status;

	private String grade;//岗位等级

	private Integer nums;

	/** 用户是否存在此岗位标识 默认不存在 */
	private boolean flag = false;
}
