/*
 Navicat MySQL Data Transfer

 Source Server         : MySQL_air
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3306
 Source Schema         : moon-admin-plus

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 21/12/2021 18:47:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for my_com
-- ----------------------------
DROP TABLE IF EXISTS `my_com`;
CREATE TABLE `my_com`  (
  `com_id` int NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `parent_id` int NULL DEFAULT NULL COMMENT '上级部门',
  `com_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` bit(1) NOT NULL COMMENT '状态',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`com_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_com
-- ----------------------------
INSERT INTO `my_com` VALUES (1, 0, '南京总公司', b'1', '18346378951', '18346378951@qq.com', '南京', '2020-08-19 11:01:09', '2021-12-21 17:45:14');
INSERT INTO `my_com` VALUES (2, 0, '苏州分公司', b'1', '18346378951', '18346378951', '苏州', '2020-08-19 11:07:36', '2021-12-21 12:47:12');

-- ----------------------------
-- Table structure for my_dept
-- ----------------------------
DROP TABLE IF EXISTS `my_dept`;
CREATE TABLE `my_dept`  (
  `dept_id` int NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `parent_id` int NULL DEFAULT NULL COMMENT '上级部门',
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `phone` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `status` bit(1) NOT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `dept_fk_1`(`parent_id`) USING BTREE,
  CONSTRAINT `dept_fk_1` FOREIGN KEY (`parent_id`) REFERENCES `my_com` (`com_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_dept
-- ----------------------------
INSERT INTO `my_dept` VALUES (101, 1, '技术部门', '12312312312', NULL, '12312@qq.com', b'1', '2020-08-19 11:01:28', '2021-12-21 15:26:36');
INSERT INTO `my_dept` VALUES (102, 2, '市场部门', '18346378951', NULL, '18346@qq.com', b'1', '2020-08-19 11:01:47', '2021-12-17 20:04:53');
INSERT INTO `my_dept` VALUES (103, 2, '运维部门', '18346378951', NULL, '18346378951', b'1', '2020-08-19 11:02:01', '2020-08-19 11:02:04');
INSERT INTO `my_dept` VALUES (104, 2, '营销部门', '18346378951', NULL, '18346378951', b'1', '2020-08-19 11:08:40', '2020-08-21 20:32:40');
INSERT INTO `my_dept` VALUES (105, 1, '运维部门', '18346378951', NULL, '18346378951', b'1', '2020-08-19 11:08:56', '2020-09-08 18:03:56');

-- ----------------------------
-- Table structure for my_dict
-- ----------------------------
DROP TABLE IF EXISTS `my_dict`;
CREATE TABLE `my_dict`  (
  `dict_id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dict_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典描述',
  `sort` int NULL DEFAULT NULL COMMENT '字典排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_dict
-- ----------------------------
INSERT INTO `my_dict` VALUES (1, '性别', '性别字典', 1, 'admin', 'admin', '2020-11-07 15:06:18', '2020-11-07 15:06:20');

-- ----------------------------
-- Table structure for my_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `my_dict_detail`;
CREATE TABLE `my_dict_detail`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `dict_id` int NULL DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字典值',
  `sort` int NULL DEFAULT NULL COMMENT '字典详情排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_dict_detail
-- ----------------------------
INSERT INTO `my_dict_detail` VALUES (1, 1, '男', '1', 1, NULL, NULL, NULL, NULL);
INSERT INTO `my_dict_detail` VALUES (2, 1, '女', '2', 2, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for my_job
-- ----------------------------
DROP TABLE IF EXISTS `my_job`;
CREATE TABLE `my_job`  (
  `job_id` int NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '岗位状态',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `grade` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位等级',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_job
-- ----------------------------
INSERT INTO `my_job` VALUES (1, '部门经理', 1, 1, '2020-08-19 11:14:55', '2021-12-21 18:37:46', 'p10');
INSERT INTO `my_job` VALUES (2, '人事专员', 1, 2, '2020-08-19 11:15:30', '2021-12-21 18:36:06', 'p8');
INSERT INTO `my_job` VALUES (3, '普通员工', 1, 3, '2020-08-19 11:16:19', '2021-12-21 18:36:11', 'p5');

-- ----------------------------
-- Table structure for my_log
-- ----------------------------
DROP TABLE IF EXISTS `my_log`;
CREATE TABLE `my_log`  (
  `log_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `time` bigint NULL DEFAULT NULL COMMENT '执行时间',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行方法',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '异常详细信息',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3653 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_log
-- ----------------------------
INSERT INTO `my_log` VALUES (3728, 'admin', '192.168.188.1', '删除所有INFO日志', '{ }', 'Chrome 9', 13, 'INFO', 'com.mysystem.log.controller.LogController.delAllByInfo()', '2021-12-21 14:51:43', NULL);
INSERT INTO `my_log` VALUES (3729, 'admin', '192.168.188.1', '删除所有ERROR日志', '{ }', 'Chrome 9', 22, 'INFO', 'com.mysystem.log.controller.LogController.delAllByError()', '2021-12-21 14:51:48', NULL);
INSERT INTO `my_log` VALUES (3730, 'admin', '192.168.188.1', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 14:52:01', NULL);
INSERT INTO `my_log` VALUES (3731, 'admin', '192.168.188.1', '查询部门', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 8, 'INFO', 'com.mysystem.admin.controller.DeptController.getDeptAll()', '2021-12-21 14:52:02', NULL);
INSERT INTO `my_log` VALUES (3732, 'admin', '192.168.188.1', '查询角色', '{ request: PageTableRequest(page=1, limit=10, offset=0) myRole: MyRole(roleId=null, roleName=null, dataScope=null, description=null) }', 'Chrome 9', 6, 'INFO', 'com.mysystem.admin.controller.RoleController.roleList()', '2021-12-21 14:52:03', NULL);
INSERT INTO `my_log` VALUES (3733, 'admin', '192.168.188.1', '查询菜单', '{ queryName: null queryType: null }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.PowerController.getPowerAll()', '2021-12-21 14:52:04', NULL);
INSERT INTO `my_log` VALUES (3734, 'admin', '192.168.188.1', '绘制部门树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 14:52:12', NULL);
INSERT INTO `my_log` VALUES (3735, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 9, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 14:52:12', NULL);
INSERT INTO `my_log` VALUES (3736, 'admin', '192.168.188.1', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 14, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 14:54:29', NULL);
INSERT INTO `my_log` VALUES (3737, 'admin', '192.168.188.1', '查询用户角色', '{ userId: 5 }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.RoleUserController.getRoleUserByUserId()', '2021-12-21 14:54:40', NULL);
INSERT INTO `my_log` VALUES (3738, 'admin', '192.168.188.1', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 11, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 14:54:40', NULL);
INSERT INTO `my_log` VALUES (3739, 'admin', '192.168.188.1', '查询用户角色', '{ userId: 8 }', 'Chrome 9', 1, 'INFO', 'com.mysystem.admin.controller.RoleUserController.getRoleUserByUserId()', '2021-12-21 14:54:43', NULL);
INSERT INTO `my_log` VALUES (3740, 'admin', '192.168.188.1', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 10, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 14:54:43', NULL);
INSERT INTO `my_log` VALUES (3741, 'admin', '192.168.188.1', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 27, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 15:05:37', NULL);
INSERT INTO `my_log` VALUES (3742, 'admin', '192.168.188.1', '查询角色', '{ request: PageTableRequest(page=1, limit=10, offset=0) myRole: MyRole(roleId=null, roleName=null, dataScope=null, description=null) }', 'Chrome 9', 14, 'INFO', 'com.mysystem.admin.controller.RoleController.roleList()', '2021-12-21 15:05:39', NULL);
INSERT INTO `my_log` VALUES (3743, 'admin', '192.168.188.1', '查询菜单', '{ queryName: null queryType: null }', 'Chrome 9', 6, 'INFO', 'com.mysystem.admin.controller.PowerController.getPowerAll()', '2021-12-21 15:05:45', NULL);
INSERT INTO `my_log` VALUES (3744, 'admin', '192.168.188.1', '绘制菜单树', '{ }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.PowerController.buildPowerAll()', '2021-12-21 15:05:46', NULL);
INSERT INTO `my_log` VALUES (3745, 'admin', '192.168.188.1', '查询部门', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 6, 'INFO', 'com.mysystem.admin.controller.DeptController.getDeptAll()', '2021-12-21 15:05:58', NULL);
INSERT INTO `my_log` VALUES (3746, 'admin', '192.168.188.1', '查询菜单', '{ queryName: null queryType: null }', 'Chrome 9', 7, 'INFO', 'com.mysystem.admin.controller.PowerController.getPowerAll()', '2021-12-21 15:10:15', NULL);
INSERT INTO `my_log` VALUES (3747, 'admin', '192.168.188.1', '查询角色', '{ request: PageTableRequest(page=1, limit=10, offset=0) myRole: MyRole(roleId=null, roleName=null, dataScope=null, description=null) }', 'Chrome 9', 34, 'INFO', 'com.mysystem.admin.controller.RoleController.roleList()', '2021-12-21 15:10:18', NULL);
INSERT INTO `my_log` VALUES (3748, 'admin', '192.168.188.1', '绘制菜单树', '{ }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.PowerController.buildPowerAll()', '2021-12-21 15:10:20', NULL);
INSERT INTO `my_log` VALUES (3749, 'admin', '192.168.188.1', '通过id绘制菜单树', '{ roleId: 1 }', 'Chrome 9', 5, 'INFO', 'com.mysystem.admin.controller.PowerController.buildPowerAllByRoleId()', '2021-12-21 15:10:23', NULL);
INSERT INTO `my_log` VALUES (3750, 'admin', '192.168.188.1', '绘制部门树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 8, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 15:10:30', NULL);
INSERT INTO `my_log` VALUES (3751, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 9, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:10:30', NULL);
INSERT INTO `my_log` VALUES (3752, 'admin', '192.168.188.1', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 13, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 15:21:40', NULL);
INSERT INTO `my_log` VALUES (3753, 'admin', '192.168.188.1', '绘制部门树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 15:22:18', NULL);
INSERT INTO `my_log` VALUES (3754, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 8, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:22:18', NULL);
INSERT INTO `my_log` VALUES (3755, 'admin', '192.168.188.1', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 14, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 15:22:32', NULL);
INSERT INTO `my_log` VALUES (3756, 'admin', '192.168.188.1', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 10, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 15:23:42', NULL);
INSERT INTO `my_log` VALUES (3757, 'admin', '192.168.188.1', '查询用户角色', '{ userId: 1 }', 'Chrome 9', 5, 'INFO', 'com.mysystem.admin.controller.RoleUserController.getRoleUserByUserId()', '2021-12-21 15:24:09', NULL);
INSERT INTO `my_log` VALUES (3758, 'admin', '192.168.188.1', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 12, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 15:24:09', NULL);
INSERT INTO `my_log` VALUES (3759, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=101, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 7, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:26:20', NULL);
INSERT INTO `my_log` VALUES (3760, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=105, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:26:21', NULL);
INSERT INTO `my_log` VALUES (3761, 'admin', '192.168.188.1', '绘制部门树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 15:26:24', NULL);
INSERT INTO `my_log` VALUES (3762, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 5, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:26:24', NULL);
INSERT INTO `my_log` VALUES (3763, 'admin', '192.168.188.1', '绘制部门树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 15:26:38', NULL);
INSERT INTO `my_log` VALUES (3764, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:26:38', NULL);
INSERT INTO `my_log` VALUES (3765, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=105, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:26:41', NULL);
INSERT INTO `my_log` VALUES (3766, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=101, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:26:41', NULL);
INSERT INTO `my_log` VALUES (3767, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 5, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:26:42', NULL);
INSERT INTO `my_log` VALUES (3768, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=101, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:26:43', NULL);
INSERT INTO `my_log` VALUES (3769, 'admin', '192.168.188.1', '查询部门', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.DeptController.getDeptAll()', '2021-12-21 15:26:51', NULL);
INSERT INTO `my_log` VALUES (3770, 'admin', '192.168.188.1', '绘制公司树', '{ myCom: MyCom(comId=null, parentId=null, comName=null, email=null, phone=null, address=null, status=null) }', 'Chrome 9', 7, 'INFO', 'com.mysystem.admin.controller.ComController.buildDeptAll()', '2021-12-21 15:28:43', NULL);
INSERT INTO `my_log` VALUES (3771, 'admin', '192.168.188.1', '绘制公司树', '{ myCom: MyCom(comId=null, parentId=null, comName=null, email=null, phone=null, address=null, status=null) }', 'Chrome 9', 1, 'INFO', 'com.mysystem.admin.controller.ComController.buildDeptAll()', '2021-12-21 15:30:38', NULL);
INSERT INTO `my_log` VALUES (3772, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=101, userName=, password=null, nickName=测试用户, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 14, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:32:47', NULL);
INSERT INTO `my_log` VALUES (3773, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=2, userName=, password=null, nickName=测试用户, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:32:51', NULL);
INSERT INTO `my_log` VALUES (3774, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=, password=null, nickName=测试用户, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:32:53', NULL);
INSERT INTO `my_log` VALUES (3775, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=, password=null, nickName=测试用户, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:32:56', NULL);
INSERT INTO `my_log` VALUES (3776, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=e, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:03', NULL);
INSERT INTO `my_log` VALUES (3777, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=e, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:04', NULL);
INSERT INTO `my_log` VALUES (3778, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=e, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:07', NULL);
INSERT INTO `my_log` VALUES (3779, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=admin, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:10', NULL);
INSERT INTO `my_log` VALUES (3780, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=admin, password=null, nickName=测试用户, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:12', NULL);
INSERT INTO `my_log` VALUES (3781, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=, password=null, nickName=测试用户, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:14', NULL);
INSERT INTO `my_log` VALUES (3782, 'admin', '192.168.188.1', '绘制部门树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 15:33:20', NULL);
INSERT INTO `my_log` VALUES (3783, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 6, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:20', NULL);
INSERT INTO `my_log` VALUES (3784, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=e, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:27', NULL);
INSERT INTO `my_log` VALUES (3785, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=te, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:35', NULL);
INSERT INTO `my_log` VALUES (3786, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=a, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:39', NULL);
INSERT INTO `my_log` VALUES (3787, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=tes, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:33:42', NULL);
INSERT INTO `my_log` VALUES (3788, 'admin', '192.168.188.1', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 15:33:54', NULL);
INSERT INTO `my_log` VALUES (3789, 'admin', '192.168.188.1', '查询部门', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.DeptController.getDeptAll()', '2021-12-21 15:33:55', NULL);
INSERT INTO `my_log` VALUES (3790, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=105, userName=tes, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 5, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:38:03', NULL);
INSERT INTO `my_log` VALUES (3791, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=2, userName=tes, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:38:04', NULL);
INSERT INTO `my_log` VALUES (3792, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=tes, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:38:05', NULL);
INSERT INTO `my_log` VALUES (3793, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:38:09', NULL);
INSERT INTO `my_log` VALUES (3794, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=1, userName=, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:38:12', NULL);
INSERT INTO `my_log` VALUES (3795, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=2, userName=, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:38:13', NULL);
INSERT INTO `my_log` VALUES (3796, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=2, userName=, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:38:13', NULL);
INSERT INTO `my_log` VALUES (3797, 'admin', '192.168.188.1', '绘制部门树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 15:38:16', NULL);
INSERT INTO `my_log` VALUES (3798, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 6, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:38:16', NULL);
INSERT INTO `my_log` VALUES (3799, 'admin', '192.168.188.1', '查询角色', '{ request: PageTableRequest(page=1, limit=10, offset=0) myRole: MyRole(roleId=null, roleName=null, dataScope=null, description=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.RoleController.roleList()', '2021-12-21 15:39:02', NULL);
INSERT INTO `my_log` VALUES (3800, 'admin', '192.168.188.1', '绘制菜单树', '{ }', 'Chrome 9', 1, 'INFO', 'com.mysystem.admin.controller.PowerController.buildPowerAll()', '2021-12-21 15:41:50', NULL);
INSERT INTO `my_log` VALUES (3801, 'admin', '192.168.188.1', '通过id绘制菜单树', '{ roleId: 1 }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.PowerController.buildPowerAllByRoleId()', '2021-12-21 15:42:50', NULL);
INSERT INTO `my_log` VALUES (3802, 'admin', '192.168.188.1', '查询菜单', '{ queryName: null queryType: null }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.PowerController.getPowerAll()', '2021-12-21 15:43:49', NULL);
INSERT INTO `my_log` VALUES (3803, 'admin', '192.168.188.1', '绘制菜单树', '{ }', 'Chrome 9', 1, 'INFO', 'com.mysystem.admin.controller.PowerController.buildPowerAll()', '2021-12-21 15:44:13', NULL);
INSERT INTO `my_log` VALUES (3804, 'admin', '192.168.188.1', '绘制菜单树', '{ }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.PowerController.buildPowerAll()', '2021-12-21 15:45:01', NULL);
INSERT INTO `my_log` VALUES (3805, 'admin', '192.168.188.1', '绘制菜单树', '{ }', 'Chrome 9', 1, 'INFO', 'com.mysystem.admin.controller.PowerController.buildPowerAll()', '2021-12-21 15:45:09', NULL);
INSERT INTO `my_log` VALUES (3806, 'admin', '192.168.188.1', '绘制部门树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 15:47:36', NULL);
INSERT INTO `my_log` VALUES (3807, 'admin', '192.168.188.1', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 6, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 15:47:36', NULL);
INSERT INTO `my_log` VALUES (3808, 'admin', '169.254.11.217', '查询角色', '{ request: PageTableRequest(page=1, limit=10, offset=0) myRole: MyRole(roleId=null, roleName=null, dataScope=null, description=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.RoleController.roleList()', '2021-12-21 17:41:23', NULL);
INSERT INTO `my_log` VALUES (3809, 'admin', '169.254.11.217', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 17:41:23', NULL);
INSERT INTO `my_log` VALUES (3810, 'admin', '169.254.11.217', '查询部门', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 5, 'INFO', 'com.mysystem.admin.controller.DeptController.getDeptAll()', '2021-12-21 17:45:08', NULL);
INSERT INTO `my_log` VALUES (3811, 'admin', '169.254.11.217', '修改部门', '{ dept: MyDept(deptId=1, parentId=0, deptName=南京总公司, email=18346378951@qq.com, phone=18346378951, address=南京, status=1) }', 'Chrome 9', 14, 'INFO', 'com.mysystem.admin.controller.DeptController.updateMenu()', '2021-12-21 17:45:14', NULL);
INSERT INTO `my_log` VALUES (3812, 'admin', '169.254.11.217', '查询部门', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 2, 'INFO', 'com.mysystem.admin.controller.DeptController.getDeptAll()', '2021-12-21 17:45:16', NULL);
INSERT INTO `my_log` VALUES (3813, 'admin', '169.254.11.217', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 12, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 17:59:23', NULL);
INSERT INTO `my_log` VALUES (3814, 'admin', '169.254.11.217', '绘制部门增加树', '{ myDept: DeptComVO(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 10, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptWithoutCom()', '2021-12-21 18:30:29', NULL);
INSERT INTO `my_log` VALUES (3815, 'admin', '169.254.11.217', '查询菜单', '{ queryName: null queryType: null }', 'Chrome 9', 7, 'INFO', 'com.mysystem.admin.controller.PowerController.getPowerAll()', '2021-12-21 18:35:48', NULL);
INSERT INTO `my_log` VALUES (3816, 'admin', '169.254.11.217', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 29, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 18:35:49', NULL);
INSERT INTO `my_log` VALUES (3817, 'admin', '169.254.11.217', '修改岗位', '{ myJob: MyJob(jobId=1, jobName=部门经理, status=1, grade=p10, flag=false) }', 'Chrome 9', 16, 'INFO', 'com.mysystem.admin.controller.JobController.updateJob()', '2021-12-21 18:36:00', NULL);
INSERT INTO `my_log` VALUES (3818, 'admin', '169.254.11.217', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 5, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 18:36:01', NULL);
INSERT INTO `my_log` VALUES (3819, 'admin', '169.254.11.217', '修改岗位', '{ myJob: MyJob(jobId=2, jobName=人事专员, status=1, grade=p8, flag=false) }', 'Chrome 9', 13, 'INFO', 'com.mysystem.admin.controller.JobController.updateJob()', '2021-12-21 18:36:06', NULL);
INSERT INTO `my_log` VALUES (3820, 'admin', '169.254.11.217', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 18:36:07', NULL);
INSERT INTO `my_log` VALUES (3821, 'admin', '169.254.11.217', '修改岗位', '{ myJob: MyJob(jobId=3, jobName=普通员工, status=1, grade=p5, flag=false) }', 'Chrome 9', 14, 'INFO', 'com.mysystem.admin.controller.JobController.updateJob()', '2021-12-21 18:36:11', NULL);
INSERT INTO `my_log` VALUES (3822, 'admin', '169.254.11.217', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 7, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 18:36:12', NULL);
INSERT INTO `my_log` VALUES (3823, 'admin', '169.254.11.217', '修改岗位', '{ myJob: MyJob(jobId=4, jobName=213, status=1, grade=p6, flag=false) }', 'Chrome 9', 14, 'INFO', 'com.mysystem.admin.controller.JobController.updateJob()', '2021-12-21 18:36:16', NULL);
INSERT INTO `my_log` VALUES (3824, 'admin', '169.254.11.217', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 5, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 18:36:18', NULL);
INSERT INTO `my_log` VALUES (3825, 'admin', '169.254.11.217', '查询岗位', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) jobQueryDto: JobQueryDto(queryName=null, queryStatus=null) }', 'Chrome 9', 29, 'INFO', 'com.mysystem.admin.controller.JobController.getJobAll()', '2021-12-21 18:37:36', NULL);
INSERT INTO `my_log` VALUES (3826, 'admin', '169.254.11.217', '修改岗位状态', '{ myJob: MyJob(jobId=1, jobName=null, status=0, grade=null, flag=false) }', 'Chrome 9', 13, 'INFO', 'com.mysystem.admin.controller.JobController.changeStatus()', '2021-12-21 18:37:44', NULL);
INSERT INTO `my_log` VALUES (3827, 'admin', '169.254.11.217', '修改岗位状态', '{ myJob: MyJob(jobId=1, jobName=null, status=1, grade=null, flag=false) }', 'Chrome 9', 7, 'INFO', 'com.mysystem.admin.controller.JobController.changeStatus()', '2021-12-21 18:37:46', NULL);
INSERT INTO `my_log` VALUES (3828, 'admin', '169.254.11.217', '查询部门', '{ myDept: DeptComDto(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 11, 'INFO', 'com.mysystem.admin.controller.DeptController.getDeptAll()', '2021-12-21 18:38:38', NULL);
INSERT INTO `my_log` VALUES (3829, 'admin', '169.254.11.217', '绘制部门树', '{ myDept: DeptComDto(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 3, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 18:38:41', NULL);
INSERT INTO `my_log` VALUES (3830, 'admin', '169.254.11.217', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 10, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 18:38:41', NULL);
INSERT INTO `my_log` VALUES (3831, 'admin', '169.254.11.217', '绘制部门树', '{ myDept: DeptComDto(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 4, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 18:39:02', NULL);
INSERT INTO `my_log` VALUES (3832, 'admin', '169.254.11.217', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 6, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 18:39:02', NULL);
INSERT INTO `my_log` VALUES (3833, 'admin', '169.254.11.217', '绘制部门树', '{ myDept: DeptComDto(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 13, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 18:41:06', NULL);
INSERT INTO `my_log` VALUES (3834, 'admin', '169.254.11.217', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 37, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 18:41:06', NULL);
INSERT INTO `my_log` VALUES (3835, 'admin', '169.254.11.217', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=admin, password=null, nickName=, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 8, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 18:41:12', NULL);
INSERT INTO `my_log` VALUES (3836, 'admin', '169.254.11.217', '绘制部门树', '{ myDept: DeptComDto(deptId=null, parentId=null, deptName=null, email=null, phone=null, address=null, status=null, disabled=false) }', 'Chrome 9', 13, 'INFO', 'com.mysystem.admin.controller.DeptController.buildDeptAll()', '2021-12-21 18:45:08', NULL);
INSERT INTO `my_log` VALUES (3837, 'admin', '169.254.11.217', '查询用户', '{ pageTableRequest: PageTableRequest(page=1, limit=10, offset=0) myUser: MyUser(userId=null, deptId=null, userName=null, password=null, nickName=null, phone=null, email=null, sex=null, status=null, roleId=null, jobIds=null) }', 'Chrome 9', 38, 'INFO', 'com.mysystem.admin.controller.UserController.userList()', '2021-12-21 18:45:08', NULL);

-- ----------------------------
-- Table structure for my_power
-- ----------------------------
DROP TABLE IF EXISTS `my_power`;
CREATE TABLE `my_power`  (
  `power_id` int NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `parent_id` int NOT NULL COMMENT '父级菜单id',
  `power_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `type` tinyint(1) NOT NULL COMMENT '类型',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`power_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_power
-- ----------------------------
INSERT INTO `my_power` VALUES (1, 0, '系统管理', 'layui-icon layui-icon-set-fill', '/api/console', '', 1, 0, '2020-07-10 09:33:00', '2020-07-12 21:03:22');
INSERT INTO `my_power` VALUES (2, 1, '用户管理', 'layui-icon layui-icon-username', '/api/user/index', 'user:list', 4, 1, '2020-07-10 09:33:33', '2021-12-21 14:41:38');
INSERT INTO `my_power` VALUES (3, 1, '部门管理', 'layui-icon layui-icon layui-icon layui-icon-group', '/api/dept/index', 'dept:list', 5, 1, '2020-08-19 15:03:27', '2021-12-21 14:39:43');
INSERT INTO `my_power` VALUES (4, 1, '岗位管理', 'layui-icon layui-icon layui-icon layui-icon-group', '/api/job/index', 'job:list', 6, 1, '2020-08-19 16:31:46', '2021-12-21 14:41:34');
INSERT INTO `my_power` VALUES (5, 1, '角色管理', 'layui-icon layui-icon-user', '/api/role/index', 'role:list', 7, 1, '2020-07-10 09:34:17', '2020-07-10 09:34:20');
INSERT INTO `my_power` VALUES (6, 1, '权限管理', 'layui-icon layui-icon-vercode', '/api/power/index', 'power:list', 8, 1, '2020-07-10 09:34:50', '2021-12-21 13:49:34');
INSERT INTO `my_power` VALUES (7, 0, '系统监控', 'layui-icon layui-icon-console', '', '', 2, 0, '2020-07-10 09:35:20', '2021-12-21 14:49:26');
INSERT INTO `my_power` VALUES (8, 2, '用户新增', NULL, NULL, 'user:add', 4, 2, '2020-07-10 09:36:41', '2021-12-21 14:49:48');
INSERT INTO `my_power` VALUES (9, 2, '用户编辑', NULL, NULL, 'user:edit', 4, 2, '2020-07-10 09:37:16', '2021-12-21 14:49:49');
INSERT INTO `my_power` VALUES (10, 2, '用户删除', NULL, NULL, 'user:del', 4, 2, '2020-07-10 09:37:38', '2021-12-21 14:49:51');
INSERT INTO `my_power` VALUES (11, 3, '部门新增', 'layui-icon ', '', 'dept:add', 8, 2, '2020-08-23 16:34:39', '2021-12-21 14:50:04');
INSERT INTO `my_power` VALUES (12, 3, '部门修改', 'layui-icon ', '', 'dept:edit', 9, 2, '2020-08-23 16:35:18', '2021-12-21 14:50:06');
INSERT INTO `my_power` VALUES (13, 3, '部门删除', 'layui-icon ', '', 'dept:del', 10, 2, '2020-08-23 16:35:41', '2021-12-21 14:50:07');
INSERT INTO `my_power` VALUES (14, 4, '岗位新增', 'layui-icon ', '', 'job:add', 9, 2, '2020-08-23 16:32:59', '2021-12-21 14:50:11');
INSERT INTO `my_power` VALUES (15, 4, '岗位修改', 'layui-icon ', '', 'job:edit', 10, 2, '2020-08-23 16:33:36', '2021-12-21 14:50:12');
INSERT INTO `my_power` VALUES (16, 4, '岗位删除', 'layui-icon ', '', 'job:del', 10, 2, '2020-08-23 16:34:08', '2021-12-21 14:50:14');
INSERT INTO `my_power` VALUES (17, 5, '角色新增', NULL, NULL, 'role:add', 5, 2, '2020-07-10 09:38:02', '2021-12-21 14:46:44');
INSERT INTO `my_power` VALUES (18, 5, '角色编辑', 'layui-icon ', NULL, 'role:edit', 5, 2, '2020-07-10 09:38:30', '2021-12-21 15:06:32');
INSERT INTO `my_power` VALUES (19, 5, '角色删除', 'layui-icon ', NULL, 'role:del', 5, 2, '2020-07-10 09:38:51', '2021-12-21 15:06:35');
INSERT INTO `my_power` VALUES (20, 6, '菜单新增', NULL, NULL, 'power:add', 6, 2, '2020-07-10 09:39:16', '2021-12-21 14:46:52');
INSERT INTO `my_power` VALUES (21, 6, '菜单修改', NULL, NULL, 'power:edit', 6, 2, '2020-07-10 09:39:46', '2021-12-21 14:46:54');
INSERT INTO `my_power` VALUES (22, 6, '菜单删除', NULL, NULL, 'power:del', 6, 2, '2020-07-10 09:40:08', '2021-12-21 14:46:55');
INSERT INTO `my_power` VALUES (23, 26, '日志删除', 'layui-icon ', '', 'log:del', 7, 2, '2020-08-09 15:16:03', '2021-12-21 14:51:11');
INSERT INTO `my_power` VALUES (24, 27, '异常日志删除', 'layui-icon layui-icon layui-icon ', '', 'errorLog:del', 7, 2, '2020-08-09 15:16:30', '2021-12-21 14:51:17');
INSERT INTO `my_power` VALUES (25, 7, 'SQL监控', 'layui-icon layui-icon-chart', '/druid/login', '', 8, 1, '2020-07-10 09:35:50', '2021-12-21 14:46:59');
INSERT INTO `my_power` VALUES (26, 7, '操作日志', 'layui-icon-group', '/api/log/index', 'log:list', 7, 1, '2020-08-04 11:38:45', '2021-12-21 14:47:02');
INSERT INTO `my_power` VALUES (27, 7, '异常日志', 'layui-icon-face-cry', '/api/log/error/index', 'errorLog:list', 7, 1, '2020-08-04 11:42:22', '2021-12-21 14:47:07');

-- ----------------------------
-- Table structure for my_role
-- ----------------------------
DROP TABLE IF EXISTS `my_role`;
CREATE TABLE `my_role`  (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_role
-- ----------------------------
INSERT INTO `my_role` VALUES (1, 'ADMIN', '超级管理员，拥有所有权限', '2020-07-10 09:40:35', '2020-11-07 14:47:39', '1');
INSERT INTO `my_role` VALUES (2, 'USER', '普通用户', '2020-07-10 09:40:56', '2020-11-07 14:47:52', '2');

-- ----------------------------
-- Table structure for my_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `my_role_dept`;
CREATE TABLE `my_role_dept`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `dept_id` int NOT NULL COMMENT '部门id',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_role_dept
-- ----------------------------
INSERT INTO `my_role_dept` VALUES (2, 5);
INSERT INTO `my_role_dept` VALUES (2, 6);
INSERT INTO `my_role_dept` VALUES (2, 7);

-- ----------------------------
-- Table structure for my_role_power
-- ----------------------------
DROP TABLE IF EXISTS `my_role_power`;
CREATE TABLE `my_role_power`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `power_id` int NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `power_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_role_power
-- ----------------------------
INSERT INTO `my_role_power` VALUES (1, 1);
INSERT INTO `my_role_power` VALUES (1, 2);
INSERT INTO `my_role_power` VALUES (1, 3);
INSERT INTO `my_role_power` VALUES (1, 4);
INSERT INTO `my_role_power` VALUES (1, 5);
INSERT INTO `my_role_power` VALUES (1, 6);
INSERT INTO `my_role_power` VALUES (1, 7);
INSERT INTO `my_role_power` VALUES (1, 8);
INSERT INTO `my_role_power` VALUES (1, 9);
INSERT INTO `my_role_power` VALUES (1, 10);
INSERT INTO `my_role_power` VALUES (1, 11);
INSERT INTO `my_role_power` VALUES (1, 12);
INSERT INTO `my_role_power` VALUES (1, 13);
INSERT INTO `my_role_power` VALUES (1, 14);
INSERT INTO `my_role_power` VALUES (1, 15);
INSERT INTO `my_role_power` VALUES (1, 16);
INSERT INTO `my_role_power` VALUES (1, 17);
INSERT INTO `my_role_power` VALUES (1, 18);
INSERT INTO `my_role_power` VALUES (1, 19);
INSERT INTO `my_role_power` VALUES (1, 20);
INSERT INTO `my_role_power` VALUES (1, 21);
INSERT INTO `my_role_power` VALUES (1, 22);
INSERT INTO `my_role_power` VALUES (1, 23);
INSERT INTO `my_role_power` VALUES (1, 24);
INSERT INTO `my_role_power` VALUES (1, 25);
INSERT INTO `my_role_power` VALUES (1, 26);
INSERT INTO `my_role_power` VALUES (1, 27);
INSERT INTO `my_role_power` VALUES (2, 1);
INSERT INTO `my_role_power` VALUES (2, 2);
INSERT INTO `my_role_power` VALUES (2, 3);
INSERT INTO `my_role_power` VALUES (2, 4);
INSERT INTO `my_role_power` VALUES (2, 5);
INSERT INTO `my_role_power` VALUES (2, 6);
INSERT INTO `my_role_power` VALUES (2, 7);
INSERT INTO `my_role_power` VALUES (2, 8);

-- ----------------------------
-- Table structure for my_role_user
-- ----------------------------
DROP TABLE IF EXISTS `my_role_user`;
CREATE TABLE `my_role_user`  (
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `role_user_fk1`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_role_user
-- ----------------------------
INSERT INTO `my_role_user` VALUES (1, 1);
INSERT INTO `my_role_user` VALUES (9, 1);
INSERT INTO `my_role_user` VALUES (4, 2);
INSERT INTO `my_role_user` VALUES (5, 2);
INSERT INTO `my_role_user` VALUES (6, 2);
INSERT INTO `my_role_user` VALUES (7, 2);
INSERT INTO `my_role_user` VALUES (8, 2);

-- ----------------------------
-- Table structure for my_user
-- ----------------------------
DROP TABLE IF EXISTS `my_user`;
CREATE TABLE `my_user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT 'id值',
  `dept_id` int NULL DEFAULT NULL COMMENT '部门id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_fk_1`(`dept_id`) USING BTREE,
  CONSTRAINT `user_fk_1` FOREIGN KEY (`dept_id`) REFERENCES `my_dept` (`dept_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_user
-- ----------------------------
INSERT INTO `my_user` VALUES (1, 101, 'admin', 0, '$2a$10$pAuzCLIe6Sl7kXfX6FEQ1uzM79V2njg.KtL9qawg9JkW7e1f417k2', '管理员', '13556336255', '1454564646@qq.com', 1, '2020-07-10 09:42:03', '2020-08-23 16:24:34');
INSERT INTO `my_user` VALUES (4, 102, 'test2', 1, '$2a$10$RR665iMnfCuYGY0Af344U.Fy3XmGcgjkURENW/Zea/oAEhuiLyjO.', '普通用户3', '13556336258', '1454564646@qq.com', 1, '2020-07-10 09:42:19', '2020-07-10 09:42:21');
INSERT INTO `my_user` VALUES (5, 101, 'test3', 1, '$2a$10$o0lZgmzReca24TP5viy/nOrPQty4jga1W.BG5SvgdeK9eprm.NoMa', '普通用户4', '13556336259', '1454564646@qq.com', 1, '2020-07-10 09:42:23', '2020-07-10 09:42:25');
INSERT INTO `my_user` VALUES (6, 103, 'test4', 1, '$2a$10$jNU1gXN.wAPhq5vUmLrCoeyDJbF3ReSnYQ2IulJA99drcMs1w1Som', '封禁用户', '13556336250', '1454564646@qq.com', 1, '2020-07-10 09:42:27', '2021-12-17 11:29:41');
INSERT INTO `my_user` VALUES (7, 104, 'test5', 1, '$2a$10$ADEBRX13Z9vvNxzdu/HiROaB1F7rYd5DHpE9UWeXtNOSbeB1tcWie', '封禁用户2', '13556336211', '1454564646@qq.com', 1, '2020-07-10 09:42:32', '2021-12-17 11:29:42');
INSERT INTO `my_user` VALUES (8, 101, 'test6', 1, '$2a$10$2aLbMBdNottSq13J.tfIF.5IFgTcDlWwOQI7btckzsq3vl2KtWOV6', '测试修改', '13556336253', '1454564646@qq.com', 1, '2020-07-10 09:42:36', '2021-12-17 10:31:01');
INSERT INTO `my_user` VALUES (9, 102, 'air', 0, '$2a$10$vj5Wet/1gzf0u9H5UBk0KuSl5z8VYo.SZaNoCJco5jn4hZi2e8TCG', 'air', '18346378951', '1531845081@qq.com', 1, '2021-12-17 10:27:06', '2021-12-17 10:28:23');

-- ----------------------------
-- Table structure for my_user_job
-- ----------------------------
DROP TABLE IF EXISTS `my_user_job`;
CREATE TABLE `my_user_job`  (
  `user_id` int NOT NULL COMMENT '岗位id',
  `job_id` int NOT NULL COMMENT '工作id',
  PRIMARY KEY (`user_id`, `job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of my_user_job
-- ----------------------------
INSERT INTO `my_user_job` VALUES (1, 1);
INSERT INTO `my_user_job` VALUES (4, 2);
INSERT INTO `my_user_job` VALUES (5, 1);
INSERT INTO `my_user_job` VALUES (6, 2);
INSERT INTO `my_user_job` VALUES (7, 3);
INSERT INTO `my_user_job` VALUES (8, 2);
INSERT INTO `my_user_job` VALUES (8, 3);
INSERT INTO `my_user_job` VALUES (9, 1);
INSERT INTO `my_user_job` VALUES (9, 2);

-- ----------------------------
-- View structure for com_dept
-- ----------------------------
DROP VIEW IF EXISTS `com_dept`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `com_dept` AS select `my_com`.`com_id` AS `dept_id`,`my_com`.`parent_id` AS `parent_id`,`my_com`.`com_name` AS `dept_name`,`my_com`.`email` AS `email`,`my_com`.`phone` AS `phone`,`my_com`.`status` AS `status`,`my_com`.`address` AS `address`,`my_com`.`create_time` AS `create_time`,`my_com`.`update_time` AS `update_time` from `my_com` union select `my_dept`.`dept_id` AS `dept_id`,`my_dept`.`parent_id` AS `parent_id`,`my_dept`.`dept_name` AS `dept_name`,`my_dept`.`email` AS `email`,`my_dept`.`phone` AS `phone`,`my_dept`.`status` AS `status`,`my_dept`.`address` AS `address`,`my_dept`.`create_time` AS `create_time`,`my_dept`.`update_time` AS `update_time` from `my_dept`;

-- ----------------------------
-- View structure for user_com
-- ----------------------------
DROP VIEW IF EXISTS `user_com`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_com` AS select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`nick_name` AS `nick_name`,`u`.`email` AS `email`,`u`.`sex` AS `sex`,`u`.`phone` AS `phone`,`u`.`dept_id` AS `dept_id`,`d`.`dept_name` AS `dept_name`,`c`.`com_id` AS `com_id`,`c`.`com_name` AS `com_name`,`u`.`status` AS `status` from ((`my_user` `u` join `my_dept` `d`) join `my_com` `c`) where ((`u`.`dept_id` = `d`.`dept_id`) and (`d`.`parent_id` = `c`.`com_id`));

-- ----------------------------
-- Triggers structure for table my_com
-- ----------------------------
DROP TRIGGER IF EXISTS `com_create`;
delimiter ;;
CREATE TRIGGER `com_create` BEFORE INSERT ON `my_com` FOR EACH ROW SET new.create_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_com
-- ----------------------------
DROP TRIGGER IF EXISTS `com_update`;
delimiter ;;
CREATE TRIGGER `com_update` BEFORE UPDATE ON `my_com` FOR EACH ROW SET new.update_time=now()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_dept
-- ----------------------------
DROP TRIGGER IF EXISTS `dept_create`;
delimiter ;;
CREATE TRIGGER `dept_create` BEFORE INSERT ON `my_dept` FOR EACH ROW SET new.create_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_dept
-- ----------------------------
DROP TRIGGER IF EXISTS `dept_update`;
delimiter ;;
CREATE TRIGGER `dept_update` BEFORE UPDATE ON `my_dept` FOR EACH ROW SET new.update_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_job
-- ----------------------------
DROP TRIGGER IF EXISTS `job_create`;
delimiter ;;
CREATE TRIGGER `job_create` BEFORE INSERT ON `my_job` FOR EACH ROW SET new.create_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_job
-- ----------------------------
DROP TRIGGER IF EXISTS `job_update`;
delimiter ;;
CREATE TRIGGER `job_update` BEFORE UPDATE ON `my_job` FOR EACH ROW SET new.update_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_log
-- ----------------------------
DROP TRIGGER IF EXISTS `log_create`;
delimiter ;;
CREATE TRIGGER `log_create` BEFORE INSERT ON `my_log` FOR EACH ROW SET new.create_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_power
-- ----------------------------
DROP TRIGGER IF EXISTS `power_create`;
delimiter ;;
CREATE TRIGGER `power_create` BEFORE INSERT ON `my_power` FOR EACH ROW SET new.create_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_power
-- ----------------------------
DROP TRIGGER IF EXISTS `power_update`;
delimiter ;;
CREATE TRIGGER `power_update` BEFORE UPDATE ON `my_power` FOR EACH ROW SET new.update_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_role
-- ----------------------------
DROP TRIGGER IF EXISTS `role_create`;
delimiter ;;
CREATE TRIGGER `role_create` BEFORE INSERT ON `my_role` FOR EACH ROW SET new.create_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_role
-- ----------------------------
DROP TRIGGER IF EXISTS `role_update`;
delimiter ;;
CREATE TRIGGER `role_update` BEFORE UPDATE ON `my_role` FOR EACH ROW SET new.update_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_user
-- ----------------------------
DROP TRIGGER IF EXISTS `user_create`;
delimiter ;;
CREATE TRIGGER `user_create` BEFORE INSERT ON `my_user` FOR EACH ROW SET new.create_time=NOW()
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table my_user
-- ----------------------------
DROP TRIGGER IF EXISTS `user_update`;
delimiter ;;
CREATE TRIGGER `user_update` BEFORE UPDATE ON `my_user` FOR EACH ROW SET new.update_time=NOW()
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
