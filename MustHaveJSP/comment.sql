select * from tab;

drop table member;
drop table board;
drop sequence seq_board_num;

create table user(
    id varchar(30) primary key,
    pw varchar(30)
);

create table member(
    userId varchar2(10) primary key,
    userPassword varchar2(10) not null,
    userName varchar2(30) not null,
    userGender varchar2(30) not null,
    userEmail varchar2(50) not null
);