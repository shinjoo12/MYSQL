-- 사용자 테이블
drop table if exists user_library;

create table if not exists user_library(
   user_num varchar(255) not null, 
   user_name varchar(255) not null,
   user_phone varchar(255),
   user_register varchar(255) not null,
   user_update varchar(255) not null,
   user_delete varchar(255) not null,
   user_status varchar(5) CHECK (user_status IN ('Y', 'N')) not null,
   constraint pk_user_library primary key(user_num)
)engine=innodb;

-- 대여현황 테이블
drop table if exists rental_current;

create table if not exists rental_current(
   rental_no int not null primary key,
   user_num varchar(255) not null,
   rental_date varchar(255) not null,
   rental_continue varchar(255) not null,
   rental_cancel varchar(255) not null,
   retal_status varchar(255) not null,
   constraint pk_rental_current foreign key(user_num) references user_library (user_num)
)engine = innodb;

-- 대여목록 테이블
drop table if exists borrow_library;

create table if not exists borrow_library(
   rental_no_list int auto_increment primary key, 
   rental_no int not null,
   book_no int not null,
   borrow_return varchar(255) not null,
   borrow_status varchar(255) CHECK (borrow_status IN ('Y', 'N')) not null,
   constraint borrow_library1 foreign key(rental_no) references rental_current (rental_no),
   constraint borrow_library2 foreign key(book_no) references book_list (book_no)
)engine = innodb;

-- 도서 테이블
drop table if exists book;

create table if not exists book_list(
book_no int not null unique,
book_title varchar(255) not null,
book_author varchar(255) not null,
book_register varchar(255) not null,
book_modify varchar(255) not null,
book_delete varchar(255) not null,
constraint book_list primary key(book_no)
)engine = innodb;

