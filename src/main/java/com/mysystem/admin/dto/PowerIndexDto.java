package com.mysystem.admin.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;


@Data
public class PowerIndexDto implements Serializable {

    private Integer id;

    private Integer parentId;

    private String title;

    private String icon;

    private Integer type;

    private String href;

    private String permission;

    private List<PowerIndexDto> children;
}
