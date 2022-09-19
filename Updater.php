<?php

namespace Sut;

class Updater
{
	private $dbconn;

	function __construct(Database $database)
	{
		$this->dbconn = $database->dbconn;
	}

	private function createOptionsTable()
	{
		$db = $this->dbconn;
		$db->query("
		CREATE TABLE IF NOT EXISTS `s_options` (
 `ID` int NOT NULL AUTO_INCREMENT,
 `NAME` varchar(255) DEFAULT NULL,
 `VALUE` varchar(255) DEFAULT NULL,
 PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into s_options (NAME, VALUE) values ('database_version', 0);
			");
	}

	public function getDbVersion(): int
	{
		$result = $this->dbconn->query("select value from s_options where NAME = 'database_version'");
		if (empty($result->fetch_assoc()))
		{
			$this->createOptionsTable();
			return 0;
		}
		return $result->fetch_assoc()['value'];
	}

	private function setDbVersion(int $version)
	{
		$this->dbconn->query("update s_options set VALUE = {$version} where NAME = 'database_version'");
	}

	public function updateDb()
	{
		$version = $this->getDbVersion();
		$db = $this->dbconn;
		if ($version <= 2)
		{
			$db->query('
create table s_test
(
	ID   int auto_increment,
	NAME varchar(255) null,
	constraint table_name_pk
		primary key (ID)
);
');
			$this->setDbVersion(3);
		}

		// empty query
		if ($version <= 3)
		{
			$db->query("

			");
			$this->setDbVersion(4);
		}

		if ($version <= 4)
		{
			$db->query("
			drop table if exists s_test;
			");
			$this->setDbVersion(5);
		}

		if ($version <= 5)
		{
			$db->query("
create table IF NOT EXISTS s_city
(
	ID          int auto_increment,
	NAME        varchar(255) null,
	DESCRIPTION text         null,
	POPULATION  int          null,
	constraint s_city_pk
		primary key (ID)
);");
			$db->query("

create table IF NOT EXISTS s_region
(
	ID          int auto_increment,
	NAME        varchar(255) null,
	REGION_CODE int          null,
	constraint s_region_pk
		primary key (ID)
);");
			$db->query("

alter table s_city
	add REGION_ID int null;");
			$db->query("

alter table s_city
	add constraint s_city_s_region_ID_fk
		foreign key (REGION_ID) references s_region (ID);");
			$db->query("

create table IF NOT EXISTS s_object_type
(
	ID   int auto_increment,
	NAME VARCHAR(255) null,
	constraint s_object_type_pk
		primary key (ID)
);
			");
			// избавиться от хардкода в отелях - заменить на объекты разных типов
			$this->setDbVersion(6);
		}


		if ($version <= 6)
		{
			$db->query("
create table IF NOT EXISTS s_object_type
(
	ID   int          null,
	NAME VARCHAR(255) null
);");
			$db->query("

create table IF NOT EXISTS s_object
(
	ID          int auto_increment,
	NAME        VARCHAR(255) null,
	DESCRIPTION TEXT         null,
	CITY_ID     int          null,
	IS_ACTIVE   CHAR         null,
	constraint s_object_pk
		primary key (ID),
	constraint s_object_s_city_ID_fk
		foreign key (CITY_ID) references s_city (ID)
);");
			$db->query("

create table IF NOT EXISTS s_prop
(
	ID   int auto_increment,
	NAME VARCHAR(255) null,
	constraint s_prop_pk
		primary key (ID)
);");
			$db->query("

create table IF NOT EXISTS s_object_props
(
	ID        int auto_increment,
	OBJECT_ID int          null,
	PROP_ID   int          null,
	VALUE     VARCHAR(255) null,
	constraint s_object_props_pk
		primary key (ID)
);");
			$db->query("

create table IF NOT EXISTS s_service
(
	ID          int auto_increment,
	NAME        VARCHAR(255) null,
	DESCRIPTION VARCHAR(255) null,
	constraint s_service_pk
		primary key (ID)
);");
			$db->query("

create table IF NOT EXISTS s_object_service
(
	OBJECT_ID  int null,
	SERVICE_ID int null
);");
			$db->query("

create table IF NOT EXISTS s_user
(
	ID        int auto_increment,
	NAME      VARCHAR(255)           null,
	DATE_REG  DATETIME default NOW() null,
	PHONE     VARCHAR(40)            null,
	EMAIL     VARCHAR(60)            null,
	IS_ACTIVE CHAR                   null,
	constraint s_user_pk
		primary key (ID)
);



			");
			$this->setDbVersion(7);
		}


		if ($version <= 7)
		{
			$db->query("

alter table s_object_props
	add constraint s_object_props_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID);");

			$db->query("
alter table s_object_props
	add constraint s_object_props_s_prop_ID_fk
		foreign key (PROP_ID) references s_prop (ID);");

			$db->query("
alter table s_object
	add TYPE_ID int null;");

			$db->query("
alter table s_object
	add constraint s_object_s_object_type_ID_fk
		foreign key (TYPE) references s_object_type (ID);");

			$db->query("
alter table s_object_service
	add constraint s_object_service_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID);");
			$db->query("
alter table s_object_service
	add constraint s_object_service_s_service_ID_fk
		foreign key (SERVICE_ID) references s_service (ID);");

			$db->query("
create table IF NOT EXISTS s_object_owner
(
	OBJECT_ID int null,
	USER_ID   int null,
	constraint s_object_owner_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID),
	constraint s_object_owner_s_user_ID_fk
		foreign key (USER_ID) references s_user (ID)
);

			");
			$this->setDbVersion(8);
		}

		if ($version <= 8)
		{
			$db->query("
create table s_contract
(
	ID         int auto_increment,
	OBJECT_ID  int  null,
	OWNER_ID   int  null,
	DATE_START DATE null,
	DATE_END   DATE null,
	SUM        int  null,
	constraint s_contract_pk
		primary key (ID),
	constraint s_contract_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID),
	constraint s_contract_s_user_ID_fk
		foreign key (OWNER_ID) references s_user (ID)
);");

			$db->query("
create table s_booking
(
	ID        int          null,
	NAME      VARCHAR(255) null,
	DATE_ADD  DATE         null,
	IS_ACTIVE CHAR         null
);


			");
			$this->setDbVersion(9);
		}

		if ($version <= 9)
		{
			$db->query("
alter table s_booking
	add constraint s_booking_pk
		primary key (ID);");

			$db->query("
alter table s_booking
	modify ID int auto_increment;");

			$db->query("
create table s_object_clicks
(
	OBJECT_ID         int  null,
	BOOKING_SYSTEM_ID int  null,
	DATE              DATE null,
	CLICKS            int  null,
	constraint s_object_clicks_s_booking_ID_fk
		foreign key (BOOKING_SYSTEM_ID) references s_booking (ID),
	constraint s_object_clicks_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
);
			");

			$commands = file_get_contents("sql/data.sql");
			$db->multi_query($commands);
			$this->setDbVersion(10);
		}

		if ($version <= 10)
		{
			$this->setDbVersion(11);
		}

		if ($version <= 11)
		{
			// foreign keys
			$commands = "
alter table s_city
	drop foreign key s_city_s_region_ID_fk;

alter table s_city
	add constraint s_city_s_region_ID_fk
		foreign key (REGION_ID) references s_region (ID)
			on delete set null;


alter table s_contract
	drop foreign key s_contract_s_object_ID_fk;

alter table s_contract
	add constraint s_contract_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
			on delete set null;

alter table s_contract
	drop foreign key s_contract_s_user_ID_fk;

alter table s_contract
	add constraint s_contract_s_user_ID_fk
		foreign key (OWNER_ID) references s_user (ID)
			on delete set null;



alter table s_object
	drop foreign key s_object_s_city_ID_fk;

alter table s_object
	add constraint s_object_s_city_ID_fk
		foreign key (CITY_ID) references s_city (ID)
			on delete set null;


alter table s_object_clicks
	drop foreign key s_object_clicks_s_booking_ID_fk;

alter table s_object_clicks
	add constraint s_object_clicks_s_booking_ID_fk
		foreign key (BOOKING_SYSTEM_ID) references s_booking (ID)
			on delete cascade;

alter table s_object_clicks
	drop foreign key s_object_clicks_s_object_ID_fk;

alter table s_object_clicks
	add constraint s_object_clicks_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
			on delete cascade;


alter table s_object_owner
	drop foreign key s_object_owner_s_object_ID_fk;

alter table s_object_owner
	add constraint s_object_owner_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
			on delete cascade;

alter table s_object_owner
	drop foreign key s_object_owner_s_user_ID_fk;

alter table s_object_owner
	add constraint s_object_owner_s_user_ID_fk
		foreign key (USER_ID) references s_user (ID)
			on delete set null;


alter table s_object_phone
	drop foreign key s_phone_s_object_ID_fk;

alter table s_object_phone
	add constraint s_phone_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
			on delete cascade;


alter table s_object_service
	drop foreign key s_object_service_s_object_ID_fk;

alter table s_object_service
	add constraint s_object_service_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
			on delete cascade;

alter table s_object_service
	drop foreign key s_object_service_s_service_ID_fk;

alter table s_object_service
	add constraint s_object_service_s_service_ID_fk
		foreign key (SERVICE_ID) references s_service (ID)
			on delete set null;


alter table s_props_apart
	add constraint s_props_apart_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
			on delete cascade;

alter table s_props_hotel
	add constraint s_props_hotel_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
			on delete cascade;

alter table s_props_sight
	add constraint s_props_sight_s_object_ID_fk
		foreign key (OBJECT_ID) references s_object (ID)
			on delete cascade;

			";
			$db->multi_query($commands);
			$this->setDbVersion(12);
		}

		if ($version <= 12)
		{
			// indexes
			$commands = "
create index s_object_service_OBJECT_ID_SERVICE_ID_index
	on s_object_service (OBJECT_ID, SERVICE_ID);

create index s_object_clicks_BOOKING_SYSTEM_ID_CLICKS_index
	on s_object_clicks (BOOKING_SYSTEM_ID, CLICKS);

create index s_object_phone_OBJECT_ID_index
	on s_object_phone (OBJECT_ID);

create index s_props_hotel_OBJECT_ID_index
	on s_props_hotel (OBJECT_ID);

create index s_contract_OBJECT_ID_DATE_END_DATE_START_index
	on s_contract (OBJECT_ID, DATE_END, DATE_START);

create index s_booking_hotels_HOTEL_ID_PRICE_index
	on s_booking_hotels (HOTEL_ID, PRICE);

create index s_object_owner_OBJECT_ID_USER_ID_index
	on s_object_owner (OBJECT_ID, USER_ID);



alter table s_booking_data_temp
	add constraint s_booking_data_temp_pk
		primary key (ID);

alter table s_booking_data_temp
	modify ID int auto_increment;
			";
			$db->multi_query($commands);
			$this->setDbVersion(13);
		}


		return $this->getDbVersion();
	}
}