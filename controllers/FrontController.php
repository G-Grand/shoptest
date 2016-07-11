<?php

class FrontController {

	private static $_instance = null;
	private static $_cfg = null;
	public $controller;
	public $method;

	private function __construct() {
		self::$_cfg = require "config/main.cfg.php";
		$this->set_in_path();
	}
	private function __clone() {}

	static public function getInstance() {
		if (self::$_instance == null) {
			self::$_instance = new self();
		}
		return self::$_instance;
	}

	public function run() {
		$request = trim(explode("?",$_SERVER["REQUEST_URI"])[0],"/");

		$controllerName = !empty(explode("/",$request)[1]) ? ucfirst(explode("/",$request)[1]). "Controller" : "IndexController";
		$methodName = (!empty(@$m = explode("/",$request)[2])) ? $m."Action" : "indexAction";

		//var_dump($controllerName);
		//var_dump($methodName);



		if(class_exists($controllerName)) {
			$ctrl = new $controllerName();
			if(method_exists($ctrl, $methodName) && $ctrl instanceof IController) {
				$this->controller = $controllerName;
				$this->method = $methodName;
				echo $ctrl->$methodName();
			}else {
				echo "<h1>404</h1><p>METHOD not found</p>";
			}
		}else {
			echo "<h1>404</h1><p>CONTROLLER not found</p>";
		}
		
	}

	public static function getCfg() {
		return self::$_cfg;
	}

	private function set_in_path() {
		$paths = self::$_cfg['include_path'];
		$new_path = get_include_path();
		foreach ($paths as $path) {
			$new_path .= PATH_SEPARATOR.$path;
		}
		set_include_path($new_path);
	}
}