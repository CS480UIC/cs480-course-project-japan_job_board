/*
CREATE DATABASE bookstore;


use  bookstore;

CREATE TABLE tb_user 
(
  
  username VARCHAR(50) primary key,
  `password` VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL
);
*/

create database cs480project;

Use cs480project;

create table tb_user (
user_name VARCHAR(16) primary key,
`password` VARCHAR(32) not null,
first_name varchar(32) not null,
last_name varchar(32) not null,
is_admin tinyint(1),
need_visa_sponsor tinyint(1) not null default 1,
language_proficiency varchar(16)
);

create table tb_company(
username varchar(16) primary key,
password varchar(32) not null,
company_name varchar(64) not null,
company_location varchar(64) not null,
company_bio text,
);

create table tb_job(
job_id int auto_increment primary key,
job_title varchar(64) not null,
job_location varchar(64) not null,
job_salary int,
job_language varchar(32),
job_company varchar(64) not null,
job_description text,
job_residence varchar(32)
);