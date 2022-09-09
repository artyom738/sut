<?php

namespace Sut;

class Updater
{
	private $dbconn;

	function __construct(Database $database)
	{
		$this->dbconn = $database->dbconn;
	}

	public function getDbVersion(): int
	{
		$result = $this->dbconn->query("select value from s_options where NAME = 'database_version'");
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
			drop table s_test;
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
			$this->setDbVersion(10);
		}


		return $version;
	}
}