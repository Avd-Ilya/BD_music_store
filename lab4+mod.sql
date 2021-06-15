#Функциональные требоавания: добавить товар в заказ, изменить цену товара, оформить заказ, показать текущую цену товара
USE lab3;

#1 
#добавление товара в заказ
INSERT product_to_order(id_order, id_product)
VALUES (1, 1);

INSERT product_to_order(id_order, id_product)
VALUES (2, 1);

INSERT orders( date, id_employee)
VALUES ('2021-06-01', 20);

INSERT product_to_order(id_order, id_product)
VALUES (3, 4);

INSERT product_to_order(id_order, id_product)
VALUES (3, 5);

#изменение цены товара 
UPDATE product set price = 5000 where idproduct = 11;

UPDATE product set price = 20000 where idproduct = 1;

UPDATE product set price = 1000 where idproduct = 3;

UPDATE product set price = 3000 where idproduct = 10;

UPDATE product set price = 15000 where idproduct = 2;

#оформление заказа
INSERT orders(idorders, date, id_employee)
VALUES (8, '2021-03-01', 19);

INSERT orders(idorders, date, id_employee)
VALUES (4, '2014-02-14', 13);

INSERT orders(idorders, date, id_employee)
VALUES (5, '2021-01-01', 14);

INSERT orders(idorders, date, id_employee)
VALUES (6, '2021-02-10', 15);

INSERT orders(idorders, date, id_employee)
VALUES (7, '2021-04-22', 16);

#показ текущей цены товара 
select price from lab3.product where idproduct = 1;

select price from lab3.product where idproduct = 2;

select price from lab3.product where idproduct = 3;

select price from lab3.product where idproduct = 4;

select price from lab3.product where idproduct = 10;

#2 UPDATE в разных таблицах, с WHERE
UPDATE product set price = 15000 where idproduct = 5;

UPDATE employees set fio = 'Бибиков А.Н.' where idemployees = 13;

UPDATE product set model = 'F310 super' where idproduct = 1;

UPDATE music_store set adress = 'Михайловка' where idmusic_store = 1;

UPDATE music_courses set type = '20ти дневный курс' where idmusic_courses = 11;

#3 DELETE в разных таблицах, с WHERE
DELETE from music_store where idmusic_store = 10;

DELETE from orders where idorders = 8;

INSERT manufacturer(idmanufacturer, name, adress)
VALUES (11, 'test', 'test region');
DELETE from manufacturer where idmanufacturer = 11;

DELETE from employees where idemployees = 18;

INSERT music_courses(idmusic_courses, type, id_music_instrument)
VALUES (12, 'test', 6);
DELETE from music_courses where idmusic_courses = 12;

#4 SELECT, DISTINCT, WHERE, AND/OR/NOT, IN, BETWEEN, различная работа с датами и числами, преобразование данных, IS NULL, AS
select fio from employees where idemployees = 11;

select type from music_courses where idmusic_courses = 11;

select price from lab3.product where idproduct = 3;

select distinct id_music_store from employees;

select distinct post from employees;

select distinct id_kit from product_to_kit;

select distinct date from orders;

select *from employees where post = 'Продавец' or post = 'Кассир';

select *from product where name = 'Электрогитара' or name = 'Акустическая гитара';

select *from employees where post = 'Продавец' and id_music_store = 5;

select *from product where id_music_store = 1 and price<30000;

select *from music_store where adress in ('Волгоград', 'Москва', 'Михайловка');

select *from product where id_music_store in (1, 2, 3);

select *from music_store where adress not in ('Волгоград', 'Москва', 'Михайловка');

select *from product where id_music_store not in (5, 3, 8);

select *from product where price between 1000 and 30000;

select *from employees where id_music_store between 1 and 5;

select *from orders where date between '2013-01-01' and '2021-06-01';

select *from product where price<10000 and name is not null;

#5 LIKE
select *from music_courses where type like '%20%';

select *from product where name like '%гитара%';

select *from employees where idemployees like '1_';

select *from product where name like 'Электро%';

select *from employees where fio like 'Б%';

#6 SELECT INTO или INSERT SELECT
CREATE TABLE orders_copy (
    idorders INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    date date NOT NULL,
    id_employee INT NOT NULL
);

insert INTO orders_copy (idorders, date, id_employee) select idorders, date, id_employee from orders;

CREATE TABLE music_store_copy (
    idmusic_store INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    adress varchar(30) not null
);

insert into music_store_copy values(idmusic_store, adress);

delete from music_store_copy where idmusic_store = 1;

insert INTO music_store_copy (idmusic_store, adress) select idmusic_store, adress from music_store where adress = 'Сочи' or adress = 'Михайловка';

#7 JOIN: INNER, OUTER (LEFT, RIGHT, FULL), CROSS, NATURAL
select *from accessory join vid on accessory.id_vid = vid.idvid;

select idaccessory, name from accessory join vid on accessory.id_vid = vid.idvid;

select *from type join vid on type.id_vid = vid.idvid;

select *from music_instrument join type on music_instrument.id_type = type.idtype;

select *from music_courses join music_instrument on music_courses.id_music_instrument = music_instrument.idmusic_instrument;

select *from music_instrument join type on music_instrument.id_type = type.idtype;

select *from employees join music_store on employees.id_music_store = music_store.idmusic_store;

select *from orders join employees on orders.id_employee = employees.idemployees;

select *from accessory right join vid on accessory.id_vid = vid.idvid;

select *from type right join vid on type.id_vid = vid.idvid;

select *from music_instrument right join type on music_instrument.id_type = type.idtype;

select *from music_courses right join music_instrument on music_courses.id_music_instrument = music_instrument.idmusic_instrument;

select *from music_instrument right join type on music_instrument.id_type = type.idtype;

select *from employees right join music_store on employees.id_music_store = music_store.idmusic_store;

select *from orders right join employees on orders.id_employee = employees.idemployees;

select *from employees full join music_store;

select *from product cross join music_store;

select *from accessory cross join vid;

select *from music_instrument natural join type;

select *from employees natural join music_store;

select 
*from manufacturer
left join product on manufacturer.idmanufacturer = product.id_manufacturer;

select 
*from music_store
left join product on music_store.idmusic_store = product.id_music_store;


#8 GROUP BY (некоторые с HAVING), с LIMIT, ORDER BY (ASC|DESC) вместе с COUNT, MAX, MIN, SUM, AVG
select music_store.adress, COUNT(*) AS count 
from product
join music_store on product.id_music_store = music_store.idmusic_store
group by id_music_store; -- !!!!join + left

select music_store.adress, COUNT(*) AS count 
from product
join music_store on product.id_music_store = music_store.idmusic_store
group by id_music_store
having count>1;

select id_music_store, sum(price) as sum
from product
group by id_music_store;

select music_store.adress, sum(price) as sum
from product
join music_store on product.id_music_store = music_store.idmusic_store
group by id_music_store
limit 5;

select music_store.adress, max(price) as max
from product
join music_store on product.id_music_store = music_store.idmusic_store
group by id_music_store
limit 3;

select music_store.adress, min(price) as min
from product
join music_store on product.id_music_store = music_store.idmusic_store
group by id_music_store
limit 3;

select music_store.adress, avg(price) as avg
from product
join music_store on product.id_music_store = music_store.idmusic_store
group by id_music_store;

select price, idproduct from product order by price;

select *from vid order by name;

select *from vid order by name desc;

select *from music_store order by adress;

select price, id_music_store from product order by price desc;

select price, name from product order by price;

select id_manufacturer, COUNT(*) AS count 
from product
group by id_manufacturer;

select id_manufacturer, sum(price) as sum
from product
group by id_manufacturer;

select id_manufacturer, max(price) as sum
from product
group by id_manufacturer;

#9 UNION, EXCEPT, INTERSECT
select adress
from manufacturer
union
select adress
from music_store;

#10 SELECT с ALL, ANY, EXISTS 
select price from product where price>all(select id_music_store from product);

select id_music_store from product where id_music_store=any(select id_manufacturer from product);

select price from product where price>exists(select id_manufacturer from product);

#11 GROUP_CONCAT
SELECT GROUP_CONCAT(fio) FROM employees;

SELECT GROUP_CONCAT(name SEPARATOR ' + ') as 'Наименования' FROM type;

SELECT GROUP_CONCAT(price SEPARATOR ' + ') as 'Цены' FROM product;

#12 Сложные запросы
select p.price, p.model, p.name, m.adress as 'Адрес магазина', mn.name, mn.adress as 'Адрес производителя'
from product p 
join music_store m on p.id_music_store=m.idmusic_store
join manufacturer mn on p.id_manufacturer=mn.idmanufacturer
order by p.price;

select o.idorders, o.date, o.id_employee, e.fio, e.post, e.id_music_store, m.adress
from orders o
join employees e on o.id_employee=e.idemployees
join music_store m on e.id_music_store=m.idmusic_store
order by o.idorders
limit 5;

select p.idproduct, p.model, t.name, `t`.`electronic?`, v.name
from product p
join type t on p.idproduct=t.idtype
join vid v on t.id_vid=v.idvid
where p.price>5000
order by p.idproduct;

select p.price, p.model, p.name, ptk.id_product, ptk.id_kit, k.discount
from product_to_kit ptk
join product p on ptk.id_product=p.idproduct
join kit k on ptk.id_kit=k.idkit
order by k.discount;

select o.idorders, o.date, p.price, p.model, p.name, ms.adress, mn.name, mn.adress
from orders o
join product_to_order pto on o.idorders=pto.id_order
join product p on pto.id_product=p.idproduct
join music_store ms on p.id_music_store=ms.idmusic_store
join manufacturer mn on p.id_manufacturer=mn.idmanufacturer
order by o.idorders;


#1) для сотрудника по фио за период с 5 по 10 вывести сумму на которую он оформил 
select e.fio, sum(p.price)
from employees e
join orders o on e.idemployees=o.id_employee
join product_to_order pto on o.idorders=pto.id_order
join product p on pto.id_product=p.idproduct
where o.date between '2013-01-01' and '2022-06-01'
group by e.fio;

#2) для магазина топ 5 по количеству инструментов для каждого типа
select t.name, count(t.name) as count
from music_store ms
join product p on ms.idmusic_store=p.id_music_store
join music_instrument mi on p.idproduct=mi.idmusic_instrument
join type t on mi.id_type=t.idtype
where ms.idmusic_store=1
group by t.name
limit 5;

#3) вывести все аксессуары для конкретного музыкального инструмента 
select mi.idmusic_instrument, p.name, p.model, mi.id_type, t.name, t.`electronic?`, t.id_vid, v.name, a.idaccessory, pr.name as name_accessory
from music_instrument mi
join product p on mi.idmusic_instrument=p.idproduct
join type t on mi.id_type=t.idtype
join vid v on t.id_vid=v.idvid
join accessory a on v.idvid=a.id_vid
join product pr on a.idaccessory=pr.idproduct
where mi.idmusic_instrument = 1;



