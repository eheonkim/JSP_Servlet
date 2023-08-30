-- 테이블 목록 조회
select * from tab;

drop table member;
drop table board;
drop sequence seq_board_num;

-- 회원 테이블 생성
create table member(
    id varchar2(10) not null,
    pass varchar2(10) not null,
    name varchar2(30) not null,
    regidate date default sysdate not null,
    primary key(id)
);

-- 모델 1방식의 게시판 테이블 생성
create table board (
    num number primary key,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    id varchar2(10) not null,
    postdate date default sysdate not null,
    visitcount number(6)
);


-- 외래키 설정
alter table board 
    add constraint board_mem_fk foreign key(id)
    references member (id);
    
-- 시퀀스 생성
create sequence seq_board_num
    increment by 1 -- 1식 증가
    start with 1 -- 시작값 1
    minvalue 1  -- 최소값
    nomaxvalue  -- 최대값은 무한대
    nocycle     -- 순환하지 않음
    nocache;    -- 캐시 안 함.
    
-- 더미 데이터 입력
insert into member (id, pass, name) values ('musthave', '1234', '머스트해브');
insert into board (num, title, content, id, postdate, visitcount)
    values (seq_board_num.nextval, '제목1입니다', '내용1입니다', 
            'musthave', sysdate,0);
commit;    

SELECT COUNT(*) FROM board WHERE title like '%2%';
SELECT * FROM board where title like '%1%';

INSERT INTO board VALUES (seq_board_num.nextval, '지금은 봄입니다', '봄의왈츠', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 여름입니다', '여름향기', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 가을입니다', '가을동화', 'musthave', sysdate, 0);
INSERT INTO board VALUES (seq_board_num.nextval, '지금은 겨울입니다', '겨울연가', 'musthave', sysdate, 0);
commit;


desc member;
select * from member;
select id, pass, rownum from member;

select * from (
    select tb.*, rownum rNum from(
        select * from board order by num desc
    )Tb
)
where rNum between 11 and 20;

-- 12장 파일업로드

drop table myfile;

create table myfile (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    cate varchar2(30),
    ofile varchar2(100) not null,
    sfile varchar2(30) not null,
    postdate date default sysdate not null
);    
desc myfile;
commit;

drop table mvcboard;

create table mvcboard (
    idx number primary key,
    name varchar2(50) not null,
    title varchar2(200) not null,
    content varchar2(2000) not null,
    postdate date default sysdate not null,
    ofile varchar2(200),
    sfile varchar2(30),
    downcount number(5) default 0 not null,
    pass varchar2(50) not null,
    visitcount number default 0 not null
);
desc mvcboard;

insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (idx, name, title, content, pass)
    values (seq_board_num.nextval, '대조영', '자료실 제목5 입니다.','내용','1234');

commit;    

create t

