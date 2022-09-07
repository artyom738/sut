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
);

create table IF NOT EXISTS s_region
(
	ID          int auto_increment,
	NAME        varchar(255) null,
	REGION_CODE int          null,
	constraint s_region_pk
		primary key (ID)
);

alter table s_city
	add REGION_ID int null;

alter table s_city
	add constraint s_city_s_region_ID_fk
		foreign key (REGION_ID) references s_region (ID);

create table s_object_type
(
	ID   int auto_increment,
	NAME VARCHAR(255) null,
	constraint s_object_type_pk
		primary key (ID)
);

create table IF NOT EXISTS s_hotels
(
	ID          int auto_increment,
	NAME        VARCHAR(255) null,
	DESCRIPTION TEXT         null,
	IS_ACTIVE   CHAR         null,
	CITY_ID     int          null,
	HOTEL_TYPE  int          null,
	STARS       TINYINT      null,
	constraint s_hotels_pk
		primary key (ID),
	constraint s_hotels_s_city_ID_fk
		foreign key (CITY_ID) references s_city (ID)
);

rename table s_object_type to s_hotel_type;





			");
			// избавиться от хардкода в отелях - заменить на объекты разных типов
			$this->setDbVersion(6);
		}





		return $version;
	}
}