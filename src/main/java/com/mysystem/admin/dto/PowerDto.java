package com.mysystem.admin.dto;

import lombok.Data;

import java.io.Serializable;


@Data
public class PowerDto implements Serializable {

    private Integer id;

    private Integer parentId;

    private String checkArr = "0";

    private String title;
}
