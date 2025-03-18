create table reply (
    no number primary key,
    content varchar2(500),
    ref number,
    name varchar2(20),
    rdate date
);

create sequence seq_reply nocache;

insert into reply values(seq_reply.nextval,'첫 댓글이다',1,'김기인','2025/02/01');
insert into reply values(seq_reply.nextval,'그림이 이뻐요',1,'김길동','2025/02/01');
insert into reply values(seq_reply.nextval,'화가 출신인가요?',1,'김길순','2025/02/01');
insert into reply values(seq_reply.nextval,'딱 입시 미술수준',1,'김나쁜','2025/02/01');

commit;