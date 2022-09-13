# Task 2. ��������� ������(�) ��� ������� ������� ������ ������ ���� �������� ������������� ���� ��� ��������� �������.
select o.ID,
       o.NAME,
       o.TYPE,
       sc.NAME   City,
       sr.NAME   Region,
       ss.NAME   Service,
       su.NAME   Owner,
       sph.STARS, sph.TYPE, sop.VALUE
from s_object o
	     left join s_city sc on o.CITY_ID = sc.ID
	     left join s_region sr on sr.ID = sc.REGION_ID

	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID

	     left join s_object_phone sop on o.ID = sop.OBJECT_ID

	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID

	     left join s_object_owner soo on o.ID = soo.OBJECT_ID
	     left join s_user su on su.ID = soo.USER_ID

where sr.ID = 3 and o.TYPE = 'hotel';

# Task 3 - ������ ��� ������� ������ �� �������� ������������� ���� ��������� ������
select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, ss.NAME Service, sop.VALUE
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID

	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
# ������������ left ��� inner - ���� �� �������� �� �������, � ������� �� ��������� ��������� ����?
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID

where CITY_ID = 1 and o.TYPE = 'hotel' and ss.NAME = 'Skiles Inc';

# Task 3a ��������� ����������� �� ������(��).
select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, ss.NAME Service, sop.VALUE Phone
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID

	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID

where CITY_ID = 8 and o.TYPE = 'hotel' and ss.NAME in ('Skiles Inc', 'Kovacek LLC');

# Task 3b - ��������� ���, ����� ������� ������� �������� ������� ����� ��������� ��� ������� ���������.

select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, MAX(c.DATE_START) D_start, MAX(c.DATE_END) D_end,
       (c.DATE_END > NOW()) Active, ss.NAME Service, sop.VALUE Phone
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID

	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID

	     left join s_contract c on o.ID = c.OBJECT_ID

where CITY_ID = 8 and o.TYPE = 'hotel'
group by o.ID, o.NAME, sc.NAME, sph.STARS, sph.TYPE, Active, Service, Phone
order by Active DESC, D_start DESC;


# Task 3c - ��������� ������������.

select objects.*, ss.NAME Service, sop.VALUE Phone, sph.STARS, sph.TYPE
from (select o.ID ID, o.NAME NAME, sc.NAME City, MAX(c.DATE_START) D_start, MAX(c.DATE_END) D_end,
             (c.DATE_END > NOW()) Active
      from s_object o
	           left join s_city sc on sc.ID = o.CITY_ID
	           left join s_contract c on o.ID = c.OBJECT_ID

      where CITY_ID = 8 and o.TYPE = 'hotel'
      group by o.ID, o.NAME, sc.NAME, Active
      order by Active DESC, D_start DESC
      limit 2 offset 2
     ) objects
	     left join s_object_service sos on objects.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = objects.ID
	     left join s_object_phone sop on objects.ID = sop.OBJECT_ID
	     left join s_props_hotel sph on objects.ID = sph.OBJECT_ID;


# Task 4 - ��������� ������ ��� ������� �������� ������������� ���� �� ��������� �������.

select o.ID, o.NAME, o.TYPE, sc.NAME City, sr.NAME Region
from s_object o
	     left join s_city sc on o.CITY_ID = sc.ID
	     left join s_region sr on sr.ID = sc.REGION_ID
where sr.ID = 1 and o.TYPE = 'hotel';


# Task 5 - ��������� ������(�) ��� ������� ������� ������ ������ �� ���������� ��������� ������.
# � ����������� ������� ������ ���� � ����������� ���� ������� ������������ � ������ �� ��.

select o.ID, o.NAME, o.CITY_ID,
       h.STARS, h.TYPE,
       bh.ID, sb.NAME,
       price.min_price, sbd.LINK
from s_object o
	     left join s_props_hotel h on o.ID = h.OBJECT_ID
	     left join s_booking_hotels bh on o.ID = bh.HOTEL_ID
	     left join s_booking sb on sb.ID = bh.BOOKING_SYSTEM_ID
	     left join s_booking_data sbd on bh.BOOKING_CODE = sbd.BOOKING_CODE
	     left join (

	select bh.HOTEL_ID hotel_id, MIN(bd.PRICE) min_price from s_booking_hotels bh
		left join s_booking_data bd on bd.BOOKING_CODE = bh.BOOKING_CODE
	group by bh.HOTEL_ID

) price on price.hotel_id = bh.HOTEL_ID and price.min_price = sbd.PRICE

where o.TYPE = 'hotel' and o.CITY_ID = 8 and min_price is not null
group by o.ID, o.NAME, o.CITY_ID, h.STARS, h.TYPE, bh.ID, sb.NAME, price.min_price, sbd.LINK;


# Task 6. ��������� ������(�) ��� �������� ������� � ������ ������� ���������� ���������� �������.
# ����������� �� ��� ����������. ���� ��, �� �����?

start transaction;
INSERT INTO s_object (`NAME`, `DESCRIPTION`, `CITY_ID`, `IS_ACTIVE`, `TYPE`)
VALUES ('Fusion express11', 'DESCRIPTION', 1, 'Y', 'hotel');
set @objectId = LAST_INSERT_ID();
commit;

INSERT INTO s_object_owner (OBJECT_ID, USER_ID) VALUES (@objectId, 15);

INSERT INTO s_props_hotel (OBJECT_ID, TYPE, STARS) VALUES (@objectId, '����-�����', 3);
INSERT INTO s_object_phone (OBJECT_ID, `VALUE`) VALUES (@objectId, '88005553535');
INSERT INTO s_object_phone (OBJECT_ID, `VALUE`) VALUES (@objectId, '88005558888');

INSERT INTO s_object_service (OBJECT_ID, SERVICE_ID) VALUES (@objectId, 11);
INSERT INTO s_object_service (OBJECT_ID, SERVICE_ID) VALUES (@objectId, 15);
INSERT INTO s_object_service (OBJECT_ID, SERVICE_ID) VALUES (@objectId, 3);

# Task 7. ��������� ������(�) ��� �������� ������� � ������ ������� ���������� ���������� �������.
# ����������� �� ��� ����������. ���� ��, �� �����?
# ����������� �� ������� �����? ���� ��, �� ����� (������ ����� � ������ �� �������������)?

set @objectId = 109;
delete from s_object_owner where OBJECT_ID = @objectId;
delete from s_object_phone where OBJECT_ID = @objectId;
delete from s_props_hotel where OBJECT_ID = @objectId;
delete from s_props_apart where OBJECT_ID = @objectId;
delete from s_props_sight where OBJECT_ID = @objectId;
delete from s_object_service where OBJECT_ID = @objectId;
delete from s_object where ID = @objectId;

# Task 8. ��������� ������ ��� ������ ���� �������� � ������� �������� ����� ������� �����.

select * from s_object where CITY_ID IS NULL;

# Task 9. ��������� ������ ��� ������ ���� ���������� �������� ������.

select * from s_object where IS_ACTIVE != 'Y';

# Task 10. ��������� ������ ��� ������ ���� ���������� �������� ������
# � ������� ���������� ����� �������� � ������� �� ������� (�����, ���������� ���������� ��������).

select CITY_ID, COUNT(*)
from s_object
where IS_ACTIVE != 'Y'
group by CITY_ID;

# Task 10a. ��������� ������ ����� �������, ����� � ������� ���� ������ ������,
# � ������� ���������� ���������� �������� ������ 10.

select CITY_ID, COUNT(*) cnt
from s_object
where IS_ACTIVE != 'Y'
group by CITY_ID
having cnt > 10;

# Task 11. ����� ��� ������� � �������� ������� ��������.

select o.ID, o.NAME, sop.VALUE
from s_object o
	     join s_object_phone sop on o.ID = sop.OBJECT_ID
where sop.VALUE = '370-498-0624';


# Task 12. ���������� ���� ������ ������ ��������� ������. ��� � ����� ������� ������������ ������������� ������
# � ���������� (������� ���, ����, ������ ��� ��������). ��� �������� ������ ����������� � ��������� �������.
# ���� ������ ���������������� �� � ����� ����� (�������� ������������ ������, �������� �����, ������� �������������).

update s_booking_data bd
	inner join s_booking_data_temp sbdt on bd.BOOKING_CODE = sbdt.BOOKING_CODE
set bd.PRICE = sbdt.PRICE, bd.LINK = sbdt.LINK;

insert into s_booking_data (BOOKING_CODE, PRICE, LINK)
select bdt.BOOKING_CODE, bdt.PRICE, bdt.LINK from s_booking_data_temp bdt
	left join s_booking_data bd on bdt.BOOKING_CODE = bd.BOOKING_CODE where bd.BOOKING_CODE is null;

delete from s_booking_data bd where BOOKING_CODE in
    (select * from
	    (select bd.BOOKING_CODE
	     from s_booking_data bd
	              left join s_booking_data_temp bdt on bdt.BOOKING_CODE = bd.BOOKING_CODE
	     where bdt.BOOKING_CODE is null) bd_to_delete
    );


# Task 13. ����� ��� ������� ������� � ���������� ������ 10 ���. ������� � ��������� ��������.

select o.ID, o.NAME, sc.NAME, sc.POPULATION, sc.REGION_ID
from s_object o
	left join s_city sc on sc.ID = o.CITY_ID
where sc.POPULATION < 2500000 and sc.REGION_ID in (1,2,3);

# Task 13�. ��������� ���, ����� ����� ���� ���������� ������ �� ���������� ����� ��������
# � ������� ������� (�����, ���������� ��������).

select sc.NAME, COUNT(*) cnt
from s_object o
	left join s_city sc on sc.ID = o.CITY_ID
where sc.POPULATION < 2500000 and sc.REGION_ID in (1,2,3)
group by sc.ID;


# Task 14. � ���� �� ������� ������������, �������� ����� ������������ ������ � ������ �� ��������� ����������,
# �� �� �� �����, ����� ������������ ������ ��������� ���������� �������. ����� ���� �������� ������� ���� ������?

DROP VIEW IF EXISTS V14;
CREATE VIEW V14 AS
(
SELECT O.ID, O.NAME, SC.DATE_START, SC.DATE_END
FROM s_object O
	     LEFT JOIN s_contract sc on O.ID = sc.OBJECT_ID
	);

SELECT * FROM V14;

# Task 15. � ���� �� ������� ������������, �������� ����� ����� ����������� �������� ������� ����� � ���� �����:
# �������� �������; ��������. ��� ���������� ������ ��� ������? ������ (����� / ������)?

DROP VIEW IF EXISTS V15;
CREATE VIEW V15 AS
(
SELECT O.ID, O.NAME, GROUP_CONCAT(SOP.VALUE SEPARATOR ', ') PHONES
FROM s_object O
	     LEFT JOIN s_object_phone sop on O.ID = sop.OBJECT_ID
GROUP BY 1, 2
	);

SELECT * FROM V15;

# Task 16. ��������� ������ ��� ������ ���������� ������� ��� ���� ������� � �������
# �� ������� ��������� � ��� ��������� �������� ����������.

UPDATE s_object inner join (
	select o.ID, o.NAME, o.IS_ACTIVE, sc.POPULATION, DATE_START, DATE_END
	from s_object o
		     left join s_city sc on sc.ID = o.CITY_ID
		     left join s_contract s on o.ID = s.OBJECT_ID
	where sc.POPULATION is null and NOT (NOW() > s.DATE_START AND NOW() < s.DATE_END)
) obj_disable ON obj_disable.ID = s_object.ID
set s_object.IS_ACTIVE = 'N';

# Task 17. ��������� ������ ��� ������ �� ��������� �� ������� ������������ � ������������ ����������
# �� �������� ����� � ������� (������� ������������; ���������� ���������).

select b.ID, b.NAME, book_click.clicks
from s_booking b
	left join (
		select BOOKING_SYSTEM_ID, SUM(CLICKS) clicks from s_object_clicks oc
		where oc.DATE > '2000-01-01' and oc.DATE < '2010-01-01'
	group by BOOKING_SYSTEM_ID) book_click on book_click.BOOKING_SYSTEM_ID = b.ID;

# Task 17�. ��������� ������ ���, ����� � ����������� ���� ������ ������ �� ��� �������� ������������
# �� ������� ���������� ��������� �� ��������� ������ ������ 100.

select b.ID, b.NAME, book_click.clicks
from s_booking b
	     left join (
	select BOOKING_SYSTEM_ID, SUM(CLICKS) clicks from s_object_clicks oc
	where oc.DATE > '2000-01-01' and oc.DATE < '2010-01-01'
	group by BOOKING_SYSTEM_ID
) book_click on book_click.BOOKING_SYSTEM_ID = b.ID
where clicks > 500;

# Task 17b. ��������� ������ �������� �� �������.

select b.ID BS_ID, b.NAME BS_NAME, book_click.clicks CLICKS
from s_booking b
	     left join (
	select BOOKING_SYSTEM_ID, SUM(CLICKS) clicks from s_object_clicks oc
	where oc.DATE > '2000-01-01' and oc.DATE < '2010-01-01' and oc.OBJECT_ID = 30
	group by BOOKING_SYSTEM_ID
) book_click on book_click.BOOKING_SYSTEM_ID = b.ID
where clicks > 20;


# Task 18. ��������� ������ ��� ���������� �������� ���� �������� ����� �������,
# ����� � ����� �������� �������� ������� ���������� �������� ������� � ������� �� ����������.

update s_object o2 inner join (
	select o.ID, o.NAME, sr.NAME reg_name
	from s_object o
		     left join s_city sc on sc.ID = o.CITY_ID
		     left join s_region sr on sr.ID = sc.REGION_ID
	where o.ID < 3) objects on objects.ID = o2.ID
set o2.NAME = CONCAT(o2.NAME, ' (', objects.reg_name, ')');

# Task 20. ��������� ������ ��� ��������� ���� �������� �������� ��������� ��������
# � ������� ����������� ������������� ��������.

SELECT O.ID, O.NAME, SC.ID, SC.NAME, SC.IS_REGION_CENTER
FROM s_object O
	     LEFT JOIN s_city sc on sc.ID = O.CITY_ID
WHERE O.IS_ACTIVE = 'Y'
  AND SC.IS_REGION_CENTER = 'Y';

# Task 21. ��� ���������� ����� ��������� ������� ��� �������, ������� ����������� �� �����
# �������� � ������� ����� 1000 ����. ������� ������ ��� �� �������.

SELECT O.ID, O.NAME, SUM(DATEDIFF(SC.DATE_END, SC.DATE_START)) DAYS
FROM s_object O
	     LEFT JOIN s_contract sc on O.ID = sc.OBJECT_ID
GROUP BY 1,2
HAVING DAYS > 1500;

# Task 22. ���������� ��������� �������� � ��������� ���������� ��������, ������� �� ������� ������� ����,
# �� ����� ������� ��� � �� ��� ��������. ��� ����� ����� ��������� ������ ��� ������� ���� ��������,
# ������� �� ������� ���������� ����� 7 ���� �����, �� ����� 30 ���� �����
# � ������� �� ������ ������ �� ����� ��������� ��������.

SELECT O.ID, O.NAME, DATEDIFF(NOW(), SC.DATE_END) DIFF
FROM s_object O
	     LEFT JOIN s_contract sc on O.ID = sc.OBJECT_ID
WHERE DATEDIFF(NOW(), SC.DATE_END) < 30 AND DATEDIFF(NOW(), SC.DATE_END) > 7
  AND O.ID NOT IN (
# ����� �������� �������
	SELECT O.ID
	FROM s_object O
		     LEFT JOIN s_contract sc on O.ID = sc.OBJECT_ID
	WHERE NOW() > SC.DATE_START AND NOW() < SC.DATE_END
	GROUP BY 1
);

# Task 24. � ���� � ���������� ���������� ������� ������ ������������ �������� �� �������� �� ��������� �������.
# ���������� ��������� ������ ��� �� ��������. ������ ��� �������� (���������, join, exists).

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

# ???? ��������� ��� ������
DELETE
FROM s_object_phone
WHERE EXISTS (SELECT O.ID
              FROM s_object O
	                   LEFT JOIN s_city sc on sc.ID = O.CITY_ID
              WHERE SC.REGION_ID = 2
	            AND O.ID = 2);