package com.mysystem.admin.dto;


import com.mysystem.admin.entity.BaseEntity;
import lombok.Data;

@Data
public class DeptComDto extends BaseEntity {

	private Integer deptId;

	private Integer parentId;

	private String deptName;

	private String email;

	private String phone;

	private String address;

	private Integer status;

	private boolean disabled;
}
