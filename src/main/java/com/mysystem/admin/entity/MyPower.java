package com.mysystem.admin.entity;

import lombok.Data;


@Data
public class MyPower extends BaseEntity{

    private static final long serialVersionUID = -6525908145032868815L;

    private Integer powerId;

    private Integer parentId;

    private String powerName;

    private String icon;

    private Integer type;

    private String url;

    private String permission;

    private Integer sort;
}
