package com.mysystem.admin.dto;

import com.mysystem.admin.entity.BaseEntity;
import lombok.Data;


@Data
public class DeptDto extends BaseEntity {

    private Integer id;

    private Integer parentId;

    private String checkArr = "0";

    private String title;

    private String phone;

    private String email;

    private Integer status;
}
