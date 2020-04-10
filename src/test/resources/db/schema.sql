drop table if exists `user`;
create table `user` (
  `id` int(11) not null identity primary key ,
  `name` varchar(32) not null unique ,
  `password` varchar(32) not null ,
  `email` varchar(32) not null unique ,
  `phone_number` varchar(15) not null unique ,
  `status` int(2) not null ,
  `avatar` varchar(255),
  `create_time` datetime not null default now(),
  `last_login_time` datetime not null ,
  `last_update_time` datetime not null default now()
);

drop table if exists `role`;
create table `role` (
  `id` int(11) not null identity primary key ,
  `user_id` int(11) not null,
  `name` varchar(32) not null,
  unique (`user_id`, `name`)
);

create index on `role`(`user_id`);

drop table if exists `support_address`;
create table `support_address` (
  `id` int(11) not null identity,
  `belong_to` varchar(32) not null,
  `en_name` varchar(32) not null,
  `cn_name` varchar(32) not null,
  `level` varchar(16) not null,
  `baidu_map_lng` double not null ,
  `baidu_map_lat` double not null ,
  primary key (`id`)
);

create index on `support_address` (`belong_to`,`en_name`,`level`);

drop table if exists `house`;
create table `house` (
  `id` int(11)  not null identity comment 'house唯一标识',
  `title` varchar(32) not null,
  `price` int(11) not null comment '价格',
  `area` int(11) not null comment '面积',
  `room` int(11) not null comment '卧室数量',
  `floor` int(11) not null comment '楼层',
  `total_floor` int(11) not null comment '总楼层',
  `watch_times` int(11) default '0' comment '被看次数',
  `build_year` int(4) not null comment '建立年限',
  `status` int(4) not null default '0' comment '房屋状态 0-未审核 1-审核通过 2-已出租 3-逻辑删除',
  `create_time` datetime not null default current_timestamp comment '创建时间',
  `last_update_time` datetime not null default current_timestamp,
  `city_en_name` varchar(32) not null comment '城市标记缩写 如 北京bj',
  `region_en_name` varchar(32) not null comment '区域标记缩写 如 朝阳区cyq',
  `cover` varchar(32) default null comment '封面',
  `direction` int(11) not null comment '朝向',
  `distance_to_subway` int(11) not null default '-1' comment '距地铁距离 默认-1 附近无地铁',
  `parlour` int(11) not null default '0' comment '客厅数量',
  `district` varchar(32) not null comment '所在小区',
  `admin_id` int(11) not null comment '所属管理员id',
  `bathroom` int(11) not null default '0' comment '卫生间数量',
  `street` varchar(32) not null comment '街道',
  primary key (`id`)
);

drop table if exists `house_detail`;
create table `house_detail` (
  `id` int(11) not null identity,
  `description` varchar(255) default null comment '详细描述',
  `layout_desc` varchar(255) default null comment '户型介绍',
  `traffic` varchar(255) default null comment '交通出行',
  `round_service` varchar(255) default null comment '周边配套',
  `rent_way` int(2) not null comment '租赁方式',
  `address` varchar(32) not null comment '详细地址 ',
  `subway_line_id` int(11) default null comment '附近地铁线id',
  `subway_line_name` varchar(32) default null comment '附近地铁线名称',
  `subway_station_id` int(11) default null comment '地铁站id',
  `subway_station_name` varchar(32) default null comment '地铁站名',
  `house_id` int(11) not null comment '对应house的id',
  primary key (`id`)
);

drop table if exists `house_tag`;
create table `house_tag` (
  `house_id` int(11) not null comment '房屋id',
  `id` int(11) unsigned not null auto_increment comment '标签id',
  `name` varchar(32) not null,
  primary key (`id`)
);