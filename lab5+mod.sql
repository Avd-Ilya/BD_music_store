-- lab5 
USE lab3;

-- 1 index
select p.price, p.model, p.name, m.adress as 'Адрес магазина', mn.name, mn.adress as 'Адрес производителя'
from product p 
join music_store m on p.id_music_store=m.idmusic_store
join manufacturer mn on p.id_manufacturer=mn.idmanufacturer
where p.price< 50000;

create index ind_price on product(price);

-- 2 index
select product.name
from product
join music_store on product.id_music_store=music_store.idmusic_store
where music_store.adress = 'Михайловка';

create index ind_music_store_adress on music_store(adress);

-- 3 index
select orders.date
from orders 
join employees on orders.id_employee=employees.idemployees
where employees.post = 'Продавец';

create index ind_post on employees(post);

-- 4 index
select product.name
from product
join manufacturer on product.id_manufacturer=manufacturer.idmanufacturer
where manufacturer.adress = 'США';

create index ind_adress on manufacturer(adress);

-- 5 index 
SELECT 
    product.name
FROM
    employees join orders on orders.id_employee=employees.idemployees
join product_to_order on product_to_order.id_order=orders.idorders
join product on product_to_order.id_product=product.idproduct
where employees.fio = 'Doig';

create index ind_fio on employees(fio);


-- 1 procedure
-- для сотрудника по фио за определенный период вывести сумму на которую он оформил 
delimiter //
create procedure sum_employee(
in date1 date, date2 date
)
begin
	select e.fio, sum(p.price)
	from employees e
	join orders o on e.idemployees=o.id_employee
	join product_to_order pto on o.idorders=pto.id_order
	join product p on pto.id_product=p.idproduct
	where o.date between date1 and date2
	group by e.fio;
end //
delimiter ;

call sum_employee('2000-01-01', '2021-06-06');

-- 2 procedure
-- вывести все товары цена которых меньше заданной 
delimiter //
create procedure products_with_lower_price(
in new_price int
)
begin
	select p.price, p.model, p.name, m.adress as 'Адрес магазина', mn.name, mn.adress as 'Адрес производителя'
	from product p 
	join music_store m on p.id_music_store=m.idmusic_store
	join manufacturer mn on p.id_manufacturer=mn.idmanufacturer
    where p.price < new_price
	order by p.price;
end //
delimiter ;

call products_with_lower_price(50000);

-- 3 procedure
-- вывести все товары который находятся в заданном городе
delimiter //
create procedure products_in_city(
in city varchar(100)
)
begin
	select p.price, p.model, p.name
	from product p 
	join music_store m on p.id_music_store=m.idmusic_store
    where m.adress = city
	order by p.price;
end //
delimiter ;

call products_in_city('Михайловка');


-- 1 function
-- вычислить цену комплекта со скидкой 
delimiter //
create function price_kit (
	discount int, price int
)
returns int
deterministic
begin
	declare new_price int;
    if discount is not null then
    set new_price = ((1-(discount/100))*price);
	end if;
return (new_price);
end //
delimiter ;

select price_kit(k.discount, sum(p.price))
from kit k
join product_to_kit ptk on k.idkit=ptk.id_kit
join product p on ptk.id_product=p.idproduct
where k.idkit = 1;

-- 2 function
-- вычислить среднюю цену товара в заказе
delimiter //
create function average_price_product_in_order (
	sum int, count int
)
returns int
deterministic
begin
	declare avr_price int;
    if count is not null then
    set avr_price = (sum/count);
	end if;
return (avr_price);
end //
delimiter ;

select o.idorders, average_price_order(sum(p.price), count(pto.id_product))
from orders o
join product_to_order pto on o.idorders=pto.id_order
join product p on pto.id_product=p.idproduct
group by o.idorders;

-- 3 function
-- вычислить среднюю цену конкретного товара по имени 
delimiter //
create function average_price_product (
	sum int, count int
)
returns int
deterministic
begin
	declare avr_price int;
    if count is not null then
    set avr_price = (sum/count);
	end if;
return (avr_price);
end //
delimiter ;

SELECT 
    p.name,
    AVERAGE_PRICE_PRODUCT(SUM(p.price), COUNT(p.idproduct))
FROM
    product p
WHERE
    p.name = 'Акустическая гитара';
    
-- 1 view
-- вывести все товары в заказе 1
create view product_in_order
as select p.name
from orders o
join product_to_order pto on o.idorders=pto.id_order
join product p on pto.id_product=p.idproduct
where o.idorders = 1;

select *from product_in_order;

-- 2 view 
-- вывести все заказы сотрудника
create view orders_employee
as select count(o.idorders)
from employees e
join orders o on o.id_employee=e.idemployees
where e.idemployees = 50;

select *from orders_employee;

-- 3 view
-- вывести все товары в магазине
create view product_in_music_store
as select p.name
from product p 
join music_store ms on ms.idmusic_store=p.id_music_store
where ms.adress = 'Воронеж';

select *from product_in_music_store;


-- mod 
-- Функция вход ид продукта выход реузультат тип продукта
delimiter //
create function type_product (
	id int
)
returns varchar(30)
deterministic
begin
	declare type varchar(30);    
    
    if (select music_instrument.idmusic_instrument from music_instrument where music_instrument.idmusic_instrument = id) is not null then
    set type = 'music_instrument';
	end if;
    if (select music_courses.idmusic_courses from music_courses where music_courses.idmusic_courses = id) is not null then
    set type = 'music_courses';
	end if;
    if (select accessory.idaccessory from accessory where accessory.idaccessory = id) is not null then
    set type = 'accessory';
	end if;

return (type);
end //
delimiter ;

drop function type_product;

-- id=1(music_instrument)
-- id=11(music_courses)
-- id=12(accessory)
select p.name, p.model, p.price, type_product(12) as type_product from product p where p.idproduct = 12;






