-- limit
-- 출력하는 수의 제한을 둔다.

select 
	menu_code,
	menu_name,
	menu_price
	from tbl_menu
	order by menu_price;

-- 가격이 가장 높은 
select 
	menu_code,
	menu_name,
	menu_price
	from tbl_menu
	order by menu_price desc 
	limit 3;

-- 2번 행부터 5번 행까지 조회
select 
	menu_code,
	menu_name,
	menu_price
	from tbl_menu
	order by menu_code
	limit 3,5;

-- 상위 다섯줄의 행만 조회
SELECT 
    menu_code,
    menu_name,
    menu_price
FROM
    tbl_menu
ORDER BY 
    menu_price DESC,
    menu_name ASC
LIMIT 5;
	