create table test(
    userid varchar2(30) primary key,
    userpw varchar2(30) not null
);
insert into test values('user01','pass01');
insert into test values('user02','pass02');
insert into test values('user03','pass03');
commit;

create table member(
    id varchar2(20) primary key,
    pwd varchar2(20) not null,
    name varchar2(20) not null,
    gender char(1),
    birthday char(6),
    email varchar2(30),
    zipcode char(5),
    address varchar2(100),
    detailAddress varchar2(50),
    hobby char(5),
    job varchar2(30)
);

COMMENT ON COLUMN MEMBER.ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.GENDER IS '회원성별(1,2)';
COMMENT ON COLUMN MEMBER.BIRTHDAY IS '회원생일';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원이메일';
COMMENT ON COLUMN MEMBER.ZIPCODE IS '우편번호';
COMMENT ON COLUMN MEMBER.ADDRESS IS '회원주소';
COMMENT ON COLUMN MEMBER.DETAIL_ADDRESS IS '회원상세주소';
COMMENT ON COLUMN MEMBER.HOBBY IS '회원취미';
COMMENT ON COLUMN MEMBER.JOB IS '회원직업';

insert into member values('user01','pass01','홍길동','1','990202','qwer@naver.com','13321','서울특별시 강남구 한국빌딩','801호','01010','학생');

commit;