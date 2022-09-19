# Task 2. Составить запрос(ы) для выборки полного набора данных всех объектов определенного типа
# для заданного региона.
select o.ID,
       o.NAME,
       o.TYPE,
       sc.NAME   City,
       sr.NAME   Region,
       su.NAME   Owner,
       sph.TYPE, sph.YEAR_FOUND
from s_object o
	    join s_city sc on o.CITY_ID = sc.ID
	    join s_region sr on sr.ID = sc.REGION_ID

	    left join s_props_sight sph on o.ID = sph.OBJECT_ID
	    left join s_object_owner soo on o.ID = soo.OBJECT_ID
	    left join s_user su on su.ID = soo.USER_ID

where sr.ID = 3 and o.TYPE = 'sight';


select o.ID, ss.NAME service_name
from s_object o
	     join s_city sc on o.CITY_ID = sc.ID
	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
where sc.REGION_ID = 3 and o.TYPE = 'sight';

select o.ID, sop.VALUE phone
from s_object o
	     join s_city sc on o.CITY_ID = sc.ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID
where sc.REGION_ID = 3 and o.TYPE = 'sight';

# Task 3 - запрос для выборки данных по объектам определенного типа заданного города
select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE
from s_object o
	     inner join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID
where CITY_ID = 1 and o.TYPE = 'hotel';

select o.ID, ss.NAME service_name
from s_object o
    left join s_object_service sos on o.ID = sos.OBJECT_ID
    left join s_service ss on ss.ID = sos.SERVICE_ID
where o.CITY_ID = 1 and o.TYPE = 'hotel';

select o.ID, sop.VALUE phone
from s_object o
    left join s_object_phone sop on o.ID = sop.OBJECT_ID
where o.CITY_ID = 1 and o.TYPE = 'hotel';

# Task 3a Дополнить фильтрацией по услуге(ам).
explain select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, o2.serv_id, o2.NAME Service, sop.VALUE Phone
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID
	     inner join (
    select o2.ID, ss.NAME, ss.ID serv_id from s_object o2
	    left join s_object_service sos on o2.ID = sos.OBJECT_ID
	    left join s_service ss on ss.ID = sos.SERVICE_ID
        where ss.NAME in ('Bogisich, Feil and Block', 'Keebler PLC', 'Gusikowski Ltd') and o2.TYPE = 'hotel'
) o2 on o2.ID = o.ID
and CITY_ID = 1;


select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, ss.NAME Service, sop.VALUE Phone
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID
	     join s_object_service sos on o.ID = sos.OBJECT_ID
	     join s_service ss on ss.ID = sos.SERVICE_ID
	where o.TYPE = 'hotel' and CITY_ID = 1 and ss.ID in (11,44,80);


# Task 3b - Дополнить так, чтобы объекты имеющие активный договор имели приоритет над другими объектами.

select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, ss.NAME Service, sop.VALUE Phone,
       (c.DATE_END > NOW()) Active
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID
	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
	     left join s_contract c on o.ID = c.OBJECT_ID
		where
# 	    ss.ID in (11,44,80) and
		o.TYPE = 'hotel' and CITY_ID = 1
group by o.ID, o.NAME, sc.NAME, sph.STARS, sph.TYPE, Active, Service, Phone
order by Active DESC, MAX(c.DATE_START) DESC;


# Task 3c - Дополнить постраничкой.

select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, ss.NAME Service, sop.VALUE Phone,
       MAX(c.DATE_START) D_start, MAX(c.DATE_END) D_end, (c.DATE_END > NOW()) Active
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID
	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
	     left join s_contract c on o.ID = c.OBJECT_ID
where o.ID IN (select t.ID from(
	    select o2.ID
	    from s_object o2
		         left join s_object_service sos on o2.ID = sos.OBJECT_ID
		         left join s_service ss on ss.ID = sos.SERVICE_ID
	    where
# 	    ss.ID in (11,44,80) and
		o2.TYPE = 'hotel' and o2.CITY_ID = 1
	    group by 1
	    limit 2 offset 0

) t)
group by o.ID, o.NAME, sc.NAME, sph.STARS, sph.TYPE, Active, Service, Phone
order by Active DESC, D_start DESC;


select o.ID, o.NAME, o.TYPE, o.CITY_ID, sph.STARS, sph.TYPE, ss.NAME Service, sop.VALUE Phone,
       MAX(c.DATE_START) D_start, MAX(c.DATE_END) D_end, (c.DATE_END > NOW()) Active
from (select o2.ID, o2.NAME, o2.TYPE, o2.CITY_ID
      from s_object o2
	      left join s_object_service sos on o2.ID = sos.OBJECT_ID
      where
#       sos.SERVICE_ID in (11,44,80) and
      o2.TYPE = 'hotel' and o2.CITY_ID = 1
      group by 1
      limit 2 offset 0) o
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID
	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
	     left join s_contract c on o.ID = c.OBJECT_ID
group by o.ID, o.NAME, o.TYPE, o.CITY_ID, sph.STARS, sph.TYPE, ss.NAME, sop.VALUE, Active
;


# Task 4 - Составить запрос для выборки объектов определенного типа по заданному региону.

select o.ID, o.NAME, o.TYPE, sc.NAME City, sr.NAME Region
from s_object o
	  join s_city sc on o.CITY_ID = sc.ID
	  join s_region sr on sr.ID = sc.REGION_ID
where sr.ID = 1 and o.TYPE = 'hotel';


# Task 5 - Составить запрос(ы) для выборки полного набора данных по гостиницам заданного города.
# В результатах выборки должна быть и минимальная цена системы бронирования и ссылка на неё.
# Дополнить запрос сортировкой по минимальной цене.

select o.ID, o.NAME, o.CITY_ID,
       h.STARS, h.TYPE,
       bh.ID, sb.NAME,
       price.min_price, bh.LINK
from s_object o
	     left join s_props_hotel h on o.ID = h.OBJECT_ID
	     left join s_booking_hotels bh on o.ID = bh.HOTEL_ID
	     left join s_booking sb on sb.ID = bh.BOOKING_SYSTEM_ID
	     left join (
	select bh.HOTEL_ID hotel_id, MIN(bh.PRICE) min_price from s_booking_hotels bh
	group by bh.HOTEL_ID

) price on price.hotel_id = bh.HOTEL_ID AND price.min_price = BH.PRICE

where o.TYPE = 'hotel' and o.CITY_ID = 8 and min_price is not null
order by price.min_price;


select o.ID, o.NAME, o.CITY_ID,
       h.STARS, h.TYPE,
       bh.ID, sb.NAME,
       MIN(bh.PRICE), bh.LINK
from s_object o
	     left join s_props_hotel h on o.ID = h.OBJECT_ID
	     inner join s_booking_hotels bh on o.ID = bh.HOTEL_ID
	     inner join s_booking sb on sb.ID = bh.BOOKING_SYSTEM_ID

where o.TYPE = 'hotel' and o.CITY_ID = 8
  and exists(select bh.HOTEL_ID hotel_id, MIN(bh.PRICE) min_price from s_booking_hotels bh
             group by 1, bh.PRICE
             having bh.PRICE = MIN(bh.PRICE)
     )
group by o.ID, o.NAME, o.CITY_ID, h.STARS, h.TYPE, bh.ID, sb.NAME, bh.LINK
;

# Task 5b. Какие есть несколько различных подходов для решения данной задачи?
# Можно ли тут использовать хранимую процедуру? Если да, то реализуй это решение.
# Опиши в чем плюсы и минусы использования хранимых процедур.

DROP FUNCTION IF EXISTS GET_MIN_SUM;
CREATE FUNCTION GET_MIN_SUM(HOTEL_ID INT) RETURNS INT
BEGIN
	DECLARE SUM INT DEFAULT 0;
	SELECT MIN(BH.PRICE) MIN_PRICE
	FROM s_booking_hotels BH
	WHERE BH.HOTEL_ID = HOTEL_ID
	INTO SUM;
	RETURN SUM;
end;

select distinct o.ID, o.NAME, o.CITY_ID,
       h.STARS, h.TYPE,
       bh.ID, sb.NAME,
       bh.PRICE min_price, bh.LINK
from s_object o
	     left join s_props_hotel h on o.ID = h.OBJECT_ID
	     left join s_booking_hotels bh on o.ID = bh.HOTEL_ID
	     left join s_booking sb on sb.ID = bh.BOOKING_SYSTEM_ID

where o.TYPE = 'hotel' and o.CITY_ID = 8 and bh.PRICE = GET_MIN_SUM(o.ID)

group by o.ID, o.NAME, o.CITY_ID, h.STARS, h.TYPE, bh.ID, sb.NAME, bh.PRICE, bh.LINK
order by bh.PRICE;


# Task 6. Составить запрос(ы) для создания объекта с полным набором информации владельцем объекта.
# Понадобятся ли нам транзакции. Если да, то зачем?

start transaction;
INSERT INTO s_object (`NAME`, `DESCRIPTION`, `CITY_ID`, `IS_ACTIVE`, `TYPE`)
VALUES ('Fusion express11', 'DESCRIPTION', 1, 'Y', 'hotel');
set @objectId = LAST_INSERT_ID();
commit;

INSERT INTO s_object_owner (OBJECT_ID, USER_ID) VALUES (@objectId, 15);

INSERT INTO s_props_hotel (OBJECT_ID, TYPE, STARS) VALUES (@objectId, 'Мини-отель', 3);
INSERT INTO s_object_phone (OBJECT_ID, `VALUE`) VALUES (@objectId, '88005553535');
INSERT INTO s_object_phone (OBJECT_ID, `VALUE`) VALUES (@objectId, '88005558888');

INSERT INTO s_object_service (OBJECT_ID, SERVICE_ID) VALUES (@objectId, 11);
INSERT INTO s_object_service (OBJECT_ID, SERVICE_ID) VALUES (@objectId, 15);
INSERT INTO s_object_service (OBJECT_ID, SERVICE_ID) VALUES (@objectId, 3);

# Task 7. Составить запрос(ы) для удаления объекта с полным набором информации владельцем объекта.
# Понадобятся ли нам транзакции. Если да, то зачем?
# Понадобятся ли внешние ключи? Если да, то зачем (поясни плюсы и минусы их использования)?

set @objectId = 109;
delete from s_object_owner where OBJECT_ID = @objectId;
delete from s_object_phone where OBJECT_ID = @objectId;
delete from s_props_hotel where OBJECT_ID = @objectId;
delete from s_props_apart where OBJECT_ID = @objectId;
delete from s_props_sight where OBJECT_ID = @objectId;
delete from s_object_service where OBJECT_ID = @objectId;
delete from s_object where ID = @objectId;

# Task 8. Составить запрос для поиска всех объектов в которых владелец забыл указать город.

select * from s_object where CITY_ID IS NULL;

# Task 9. Составить запрос для поиска всех неактивных объектов города.

select * from s_object where IS_ACTIVE != 'Y' and CITY_ID = 11;
show create table s_object;

# Task 10. Составить запрос для поиска всех неактивных объектов города
# с выводом количества таких объектов в разрезе по городам (город, количество неактивных объектов).

select CITY_ID, sc.NAME, COUNT(*) cnt
from s_object
left join s_city sc on sc.ID = s_object.CITY_ID
where IS_ACTIVE != 'Y'
group by CITY_ID;

# Task 10a. Дополнить запрос таким образом, чтобы в выборке были только города,
# в которых количество неактивных объектов больше 10.

select CITY_ID, sc.NAME, COUNT(*) cnt
from s_object
	     left join s_city sc on sc.ID = s_object.CITY_ID
where IS_ACTIVE != 'Y'
group by CITY_ID
having cnt > 5;

# Task 11. Найти все объекты с заданным номером телефона.

select o.ID, o.NAME, sop.VALUE
from s_object o
	     join s_object_phone sop on o.ID = sop.OBJECT_ID
where sop.VALUE = '370-498-0624';


# Task 12. Средствами базы данных решить следующую задачу. Раз в сутки системы бронирования предоставляют данные
# о гостиницах (внешний код, цена, ссылка для перехода). Эти суточные данные сохраняются в отдельную таблицу.
# Наша задача синхронизировать их с нашей базой (обновить существующие данные, добавить новые, удалить отсутствующие).

update s_booking_hotels bh
	inner join s_booking_data_temp sbdt on bh.BOOKING_CODE = sbdt.BOOKING_CODE
set bh.PRICE = sbdt.PRICE, bh.LINK = sbdt.LINK
where bh.BOOKING_SYSTEM_ID = 1;

# заранее неизвестно, по каким конкретно гостиницам пришли данные, поэтому будет "уведомление" о том, что пришли новые
# данные, надо заполнить данные о гостинице и связать их с booking_code. Поэтому INSERT-a нет
select bdt.BOOKING_CODE, bdt.PRICE, bdt.LINK
from s_booking_data_temp bdt
left join s_booking_hotels sbh on bdt.BOOKING_CODE = sbh.BOOKING_CODE
	where sbh.BOOKING_CODE is null;

delete bh from s_booking_hotels bh
left join s_booking_data_temp bdt on bdt.BOOKING_CODE = bh.BOOKING_CODE
where bdt.BOOKING_CODE is null and bh.ID = 1;


# Task 13. Найти все объекты городов с населением меньше 10 тыс. человек в указанных регионах.

select o.ID, o.NAME, sc.NAME, sc.POPULATION, sc.REGION_ID
from s_object o
	left join s_city sc on sc.ID = o.CITY_ID
where sc.POPULATION < 2500000 and sc.REGION_ID in (1,2,3);

# Task 13а. Дополнить так, чтобы можно было посмотреть данные по количеству таких объектов
# в разрезе городов (город, количество объектов).

select sc.NAME, COUNT(*) cnt
from s_object o
	left join s_city sc on sc.ID = o.CITY_ID
where sc.POPULATION < 2500000 and sc.REGION_ID in (1,2,3)
group by sc.ID;


# Task 14. В СУБД мы создали пользователя, которому нужно предоставить доступ к данным по договорам размещения,
# но мы не хотим, чтобы пользователь увидел стоимость размещения объекта. Какие есть варианты решения этой задачи?

DROP VIEW IF EXISTS V14;
CREATE VIEW V14 AS
(
SELECT O.ID, O.NAME, SC.DATE_START, SC.DATE_END
FROM s_object O
	     LEFT JOIN s_contract sc on O.ID = sc.OBJECT_ID
	);

SELECT * FROM V14;

# Task 15. В СУБД мы создали пользователя, которому нужно иметь возможность получить простой отчёт в виде строк:
# название объекта; телефоны. Как оптимально решить эту задачу? Почему (плюсы / минусы)?

DROP VIEW IF EXISTS V15;
CREATE VIEW V15 AS
(
SELECT O.ID, O.NAME, GROUP_CONCAT(SOP.VALUE SEPARATOR ', ') PHONES
FROM s_object O
	     LEFT JOIN s_object_phone sop on O.ID = sop.OBJECT_ID
GROUP BY 1, 2
	);

SELECT * FROM V15;

# Task 16. Составить запрос для сброса активности объекта для всех городов у которых
# не указано население и нет активного договора размещения.

UPDATE s_object inner join (
	select o.ID, o.NAME, o.IS_ACTIVE, sc.POPULATION, DATE_START, DATE_END
	from s_object o
		     left join s_city sc on sc.ID = o.CITY_ID
		     left join s_contract s on o.ID = s.OBJECT_ID
	where sc.POPULATION is null and NOT (NOW() > s.DATE_START AND NOW() < s.DATE_END) and o.IS_ACTIVE = 'Y'
) obj_disable ON obj_disable.ID = s_object.ID
set s_object.IS_ACTIVE = 'N';

# Task 17. Составить запрос для отчёта по переходам на системы бронирования с возможностью фильтрации
# по заданным датам в формате (система бронирования; количество переходов).

select b.ID, b.NAME, book_click.clicks
from s_booking b
	left join (
		select BOOKING_SYSTEM_ID, SUM(CLICKS) clicks from s_object_clicks oc
		where oc.DATE > '2000-01-01' and oc.DATE < '2010-01-01'
	group by BOOKING_SYSTEM_ID) book_click on book_click.BOOKING_SYSTEM_ID = b.ID;

# NEW VERSION
SELECT OC.BOOKING_SYSTEM_ID, SUM(oc.CLICKS) CLICKS FROM s_object_clicks OC
WHERE OC.DATE > '2000-01-01' and oc.DATE < '2010-01-01'
group by 1;

# Task 17а. Дополнить запрос так, чтобы в результатах были только данные по тем системам бронирования
# по которым количество переходов за указанный период больше 100.

select b.ID, b.NAME, book_click.clicks
from s_booking b
	     left join (
	select BOOKING_SYSTEM_ID, SUM(CLICKS) clicks from s_object_clicks oc
	where oc.DATE > '2000-01-01' and oc.DATE < '2010-01-01'
	group by BOOKING_SYSTEM_ID
) book_click on book_click.BOOKING_SYSTEM_ID = b.ID
where clicks > 500;

# NEW VERSION
SELECT OC.BOOKING_SYSTEM_ID, SUM(oc.CLICKS) CLICKS_CNT FROM s_object_clicks OC
WHERE OC.DATE > '2000-01-01' and oc.DATE < '2010-01-01'
group by 1
having CLICKS_CNT > 500;

# Task 17b. Дополнить запрос фильтром по объекту.

select b.ID BS_ID, b.NAME BS_NAME, book_click.clicks
from s_booking b
	     left join (
	select BOOKING_SYSTEM_ID, SUM(CLICKS) clicks from s_object_clicks oc
	where oc.DATE > '2000-01-01' and oc.DATE < '2010-01-01' and oc.OBJECT_ID = 30
	group by BOOKING_SYSTEM_ID
) book_click on book_click.BOOKING_SYSTEM_ID = b.ID
where clicks > 20;

# NEW VERSION
SELECT OC.BOOKING_SYSTEM_ID, SUM(oc.CLICKS) CLICKS_CNT FROM s_object_clicks OC
WHERE OC.DATE > '2000-01-01' and oc.DATE < '2010-01-01' AND OC.OBJECT_ID = 30
group by 1
having CLICKS_CNT > 20;


# Task 18. Составить запрос для обновления названия всем объектам таким образом,
# чтобы в конец текущего названия объекта добавилось название региона в котором он расположен.

update s_object o2 inner join (
	select o.ID, o.NAME, sr.NAME reg_name
	from s_object o
		     left join s_city sc on sc.ID = o.CITY_ID
		     left join s_region sr on sr.ID = sc.REGION_ID
	where o.ID < 3) objects on objects.ID = o2.ID
set o2.NAME = CONCAT(o2.NAME, ' (', objects.reg_name, ')');

# Task 19. Средствами базы данных решить задачу автоматического обновления количества объектов
# города для показа на странице города.

DROP TRIGGER IF EXISTS on_add_object;
CREATE TRIGGER on_add_object
	AFTER INSERT ON s_object
	FOR EACH ROW
	UPDATE s_city SET OBJECTS_CNT = OBJECTS_CNT + 1 WHERE s_city.ID = NEW.CITY_ID;

DROP TRIGGER IF EXISTS on_delete_object;
CREATE TRIGGER on_delete_object
	AFTER DELETE ON s_object
	FOR EACH ROW
	UPDATE s_city SET OBJECTS_CNT = OBJECTS_CNT - 1 WHERE s_city.ID = OLD.CITY_ID;

DROP TRIGGER IF EXISTS on_update_object;
CREATE TRIGGER on_update_object
	AFTER UPDATE ON s_object
	FOR EACH ROW
	IF OLD.CITY_ID != NEW.CITY_ID THEN
		UPDATE s_city SET OBJECTS_CNT = OBJECTS_CNT - 1 WHERE s_city.ID = OLD.CITY_ID;
		UPDATE s_city SET OBJECTS_CNT = OBJECTS_CNT + 1 WHERE s_city.ID = NEW.CITY_ID;
	END IF;

# Task 20. Составить запрос для получения всех активных объектов указанных регионов
# в городах являющимися региональными центрами.

SELECT O.ID, O.NAME, SC.ID, SC.NAME, SC.IS_REGION_CENTER
FROM s_object O
	     INNER JOIN s_city sc on sc.ID = O.CITY_ID
WHERE O.IS_ACTIVE = 'Y'
  AND SC.IS_REGION_CENTER = 'Y';

# Task 21. Для проведения акции требуется выбрать все объекты, которые размещались на сайте
# суммарно в течении более 1000 дней. Составь запрос для их выборки.

SELECT O.ID, O.NAME, SUM(DATEDIFF(SC.DATE_END, SC.DATE_START)) DAYS
FROM s_object O
	     LEFT JOIN s_contract sc on O.ID = sc.OBJECT_ID
GROUP BY 1,2
HAVING DAYS > 6000;

# Task 22. Необходимо отправить рассылку и пропушить владельцев объектов, договор по которым недавно истёк,
# но новый договор так и не был заключен. Для этого нужно составить запрос для выборки всех объектов,
# договор по которым закончился более 7 дней назад, но менее 30 дней назад
# и которые на данный момент не имеют активного договора.

SELECT O.ID, O.NAME, DATEDIFF(NOW(), SC.DATE_END) DIFF
FROM s_object O
	     LEFT JOIN s_contract sc on O.ID = sc.OBJECT_ID
WHERE DATEDIFF(NOW(), SC.DATE_END) < 50 AND DATEDIFF(NOW(), SC.DATE_END) > 7
  AND O.ID NOT IN (
# ИМЕЮТ АКТИВНЫЙ ДОГОВОР
	SELECT O.ID
	FROM s_object O
		     LEFT JOIN s_contract sc on O.ID = sc.OBJECT_ID
	WHERE NOW() > SC.DATE_START AND NOW() < SC.DATE_END
	GROUP BY 1
);

# Task 24. В базу в результате неудачного импорта попали некорректные телефоны по объектам из заданного региона.
# Необходимо составить запрос для их удаления. Сделай три варианта (подзапрос, join, exists).

DELETE
FROM s_object_phone
WHERE s_object_phone.OBJECT_ID IN
      (SELECT O.ID
       FROM s_object O
	            LEFT JOIN s_city sc on sc.ID = O.CITY_ID
       WHERE SC.REGION_ID = 2
	     AND O.ID = 2);

DELETE OP
FROM s_object_phone OP
	     INNER JOIN s_object O ON O.ID = OP.OBJECT_ID
	     INNER JOIN S_CITY SC ON O.CITY_ID = SC.ID
WHERE SC.REGION_ID = 2 AND O.ID = 2;

# ???? УДАЛЯЮТСЯ ВСЕ ЗАПИСИ
DELETE
FROM s_object_phone
WHERE EXISTS (SELECT O.ID
              FROM s_object O
	                   LEFT JOIN s_city sc on sc.ID = O.CITY_ID
              WHERE SC.REGION_ID = 2
	            AND O.ID = 2);

DELETE
FROM s_object_phone sop
WHERE EXISTS (SELECT O.ID
              FROM s_object O
	                   LEFT JOIN s_city sc on sc.ID = O.CITY_ID
              WHERE SC.REGION_ID = 2 AND O.ID = sop.OBJECT_ID AND O.ID = 2);