<?php

namespace Sut;

use mysqli;

class Database
{
	public $dbconn;
	private static $instance;

	function __construct()
	{
		$dbconn = new mysqli('localhost', 'php', 'php', 'sut');
		$this->dbconn = $dbconn;
	}

	public static function getInstance(): Database
	{
		if (self::$instance === null)
		{
			self::$instance = new self();
		}
		return self::$instance;
	}
}