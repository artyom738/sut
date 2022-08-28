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
		$result = $this->dbconn->query('select value from s_options where NAME = "database_version"');
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
			$db->query('

			');
			$this->setDbVersion(4);
		}
	}
}