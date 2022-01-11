package com.mysystem.admin.entity;

import lombok.Data;

@Data
public class MyCom extends BaseEntity{
	private static final long serialVersionUID = 8925514045582235633L;

	private Integer comId;

	private Integer parentId;

	private String comName;

	private String email;

	private String phone;

	private String address;

	private Integer status;

}
