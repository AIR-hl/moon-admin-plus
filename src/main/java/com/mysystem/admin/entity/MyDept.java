package com.mysystem.admin.entity;

import lombok.Data;


@Data
public class MyDept extends BaseEntity {
    private static final long serialVersionUID = 8925514045582235633L;

    private Integer deptId;

    private Integer parentId;

    private String deptName;

    private String email;

    private String phone;

    private String address;

    private Integer status;

}
