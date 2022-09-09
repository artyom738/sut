# Task 2
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

# Task 3 - запрос для выборки данных по объектам определенного типа заданного города
select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, ss.NAME Service, sop.VALUE
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID

	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
# использовать left или inner - надо ли выводить те объекты, у которых не заполнены некоторые поля?
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID

where CITY_ID = 8 and o.TYPE = 'hotel' and ss.NAME = 'Skiles Inc';

# Task 3a Дополнить фильтрацией по услуге(ам).
select o.ID, o.NAME, sc.NAME City, sph.STARS, sph.TYPE, ss.NAME Service, sop.VALUE Phone
from s_object o
	     left join s_city sc on sc.ID = o.CITY_ID
	     left join s_props_hotel sph on o.ID = sph.OBJECT_ID

	     left join s_object_service sos on o.ID = sos.OBJECT_ID
	     left join s_service ss on ss.ID = sos.SERVICE_ID
	     left join s_object_phone sop on o.ID = sop.OBJECT_ID

where CITY_ID = 8 and o.TYPE = 'hotel' and ss.NAME in ('Skiles Inc', 'Kovacek LLC');

# Task 3b - Дополнить так, чтобы объекты имеющие активный договор имели приоритет над другими объектами.

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


# Task 3c - Дополнить постраничкой.

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


# Task 4 - Составить запрос для выборки объектов определенного типа по заданному региону.

select o.ID, o.NAME, o.TYPE, sc.NAME City, sr.NAME Region
from s_object o
	     left join s_city sc on o.CITY_ID = sc.ID
	     left join s_region sr on sr.ID = sc.REGION_ID
where sr.ID = 1 and o.TYPE = 'hotel';

# Task 5 - Составить запрос(ы) для выборки полного набора данных по гостиницам заданного города.
# В результатах выборки должна быть и минимальная цена системы бронирования и ссылка на неё.

select o.ID, o.NAME, o.CITY_ID,
       h.STARS, h.TYPE,
       bh.ID, sb.NAME,
       price.LINK, price.min_price
from s_object o
	     left join s_props_hotel h on o.ID = h.OBJECT_ID
	     left join s_booking_hotels bh on o.ID = bh.HOTEL_ID
	     left join s_booking sb on sb.ID = bh.BOOKING_SYSTEM_ID
	     left join (

	select bh.HOTEL_ID hotel_id, bd.LINK, MIN(bd.PRICE) min_price from s_booking_hotels bh
		                                                                   left join s_booking_data bd on bd.BOOKING_CODE = bh.BOOKING_CODE
	group by bh.HOTEL_ID

) price on price.hotel_id = bh.HOTEL_ID
where o.TYPE = 'hotel' and o.CITY_ID = 8
group by o.ID, o.NAME, o.CITY_ID, h.STARS, h.TYPE, bh.ID, sb.NAME, price.LINK, price.min_price;


select bd.ID, bh.HOTEL_ID, bd.PRICE from s_booking_hotels bh
	                                         left join s_booking_data bd on bd.BOOKING_CODE = bh.BOOKING_CODE
where bd.PRICE = (select min(bd.PRICE) from s_booking_data bd);