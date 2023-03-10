-- schema.sql

drop database if exists awesome;

create database awesome;

use awesome;

create user 'www-data'@'localhost' identified by 'www-data';
grant select, insert, update, delete on awesome.* to 'www-data'@'localhost' with grant option;
-- grant select, insert, update, delete on awesome.* to 'www-data'@'localhost' identified by 'www-data';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON awesome.* TO 'www-data'@'localhost' WITH auth_string = password('www-data');
-- GRANT SELECT, INSERT, UPDATE, DELETE ON awesome.* TO 'www-data'@'localhost';
-- SET PASSWORD FOR 'www-data'@'localhost' = password('www-data');

create table users (
    `id` varchar(50) not null,
    `email` varchar(50) not null,
    `passwd` varchar(50) not null,
    `admin` bool not null,
    `name` varchar(50) not null,
    `image` varchar(500) not null,
    `created_at` real not null,
    unique key `idx_email` (`email`),
    key `idx_created_at` (`created_at`),
    primary key (`id`)
) engine=innodb default charset=utf8;

create table blogs (
    `id` varchar(50) not null,
    `user_id` varchar(50) not null,
    `user_name` varchar(50) not null,
    `user_image` varchar(500) not null,
    `name` varchar(50) not null,
    `summary` varchar(200) not null,
    `content` mediumtext not null,
    `created_at` real not null,
    key `idx_created_at` (`created_at`),
    primary key (`id`)
) engine=innodb default charset=utf8;

create table comments (
    `id` varchar(50) not null,
    `blog_id` varchar(50) not null,
    `user_id` varchar(50) not null,
    `user_name` varchar(50) not null,
    `user_image` varchar(500) not null,
    `content` mediumtext not null,
    `created_at` real not null,
    key `idx_created_at` (`created_at`),
    primary key (`id`)
) engine=innodb default charset=utf8;