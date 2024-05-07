/*DML(data manipulation language)*/

-- INSERT, UPDATE ,DELETE , SELECT(DQL)
-- : 데이터 조작 언어, 테이블에 값을 삽입하거나, 수정하거나
-- 삭제하거나, 조회하는 언어

-- INSERT
-- 새로운 행을 추가하는 구문이다.
-- 테이블 행의 수가 증가한다.
insert into tbl_menu VALUES(null,'바나나해장국', 8500,4,'Y');

insert * from  tbl_menu 
		(
		menu_name, menu_price, category_code, orderable_status
		
		)values(
		'초콜릿죽',6000,7,'y'
		);
	
	-- 등록하는 컬럼의 순서는 상관없다.
	-- 단 컬럼의 순서에 맞는 값을 매칭해야 한다.
	insert * from  tbl_menu 
		(
		menu_name, orderable_status, category_code, menu_price
		
		)values(
		'뺵사이즈 아메리카노','y',7,3000
		);
		select * from  tbl_menu ;
	
	-- multi insert
	insert into tbl_menu
		VALUES(null,'바나나해장국', 8500, 4 ,'Y'),
				(null,'뼈다귀 해장국', 8500, 4 ,'Y'),
				(null,'왕뚝배기 해장국', 8500, 4 ,'Y');
		select * from  tbl_menu;
	
	-- update 
	-- 테이블에 기록된 컬럼의 값을 수정하는 구문이다.
	-- 테이블의 전체 행 갯수는 변화가 없다.
	
	
	select 
		menu_code,
		category_code
		from tbl_menu 
		where menu_name = "바나나해장국";
	
	update tbl_menu 
		set menu_name = "바나나 탕후루"
		where menu_code = 22;
	
	-- 가상의 view 를 형성해서 조회
	-- mysql 은 oracle과 달리 update나 delete 시 자기 자신 테이블의 데이터를 사용하면 1093에러가 발생한다.
		update tbl_menu 
		set category_code  = 6
		where menu_code = (select
							menu_code 	
							from tbl_menu
							select
							menu_code 
							from tbl_menu 
							where menu_name ="바나나 탕후루"
						) as tmp
);
select 
	*
from tbl_menu;

	-- delete
delete from tbl_menu 
order by menu_price; desc 
limit 2;

select * from tbl_menu 
order by menu_price desc;

delete from tbl_menu 
where menu_price =8500;

-- replace
-- insert 시 primary key 또는 unique key가 충돌이 발생할 수 있다면
-- replace를 통해 중복된 데이터를 덮어 쓸수 있다.

replace into tbl_menu values (12,'참기름라떼',5000,10,'Y');
insert into tbl_menu values (12,'참기름라떼',5000,10,'Y');
select * from tbl_menu;













	





