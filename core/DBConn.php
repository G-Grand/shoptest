<?php

class DBConn {
	public $nnn;

	private $_dbcon;

	private static $_instance = null;

	private function __construct() {
		$cfg = FrontController::getCfg()["DBConnection"];
		$this->_dbcon = new PDO("mysql:host=".$cfg["host"].";dbname=".$cfg["name"].";charset=utf8",$cfg["user"],$cfg["pass"]);
	}

	private function __clone() {}

	public static function getInstance() {
		if(self::$_instance == null) {
			self::$_instance = new DBConn();
		}
		return self::$_instance;
	}

	public function getConn() {
		return $this->_dbcon;
	}
}









