<?php

	require "controllers/FrontController.php";

	// ф-ция автозагрузки классов
	function __autoload($className) {
		$f = $className . ".php";
		$ip = explode(PATH_SEPARATOR,get_include_path());
		foreach ($ip as $path) {
			if(file_exists($path.DIRECTORY_SEPARATOR.$f)) {
				include $className . ".php";
			}
		}
	}

	// получаем экземпляр класса FrontController
	$fc = FrontController::getInstance();
	// запускаем метод run/0
	$fc->run();

//	var_dump(FrontController::getCfg());



	/*$ini = parse_ini_file("config/dbconf.ini");
	var_dump($ini);

	$dbcfg = require "config/dbconf.php";
	var_dump($dbcfg);

	$xml = simplexml_load_file('config/dbconf.xml');
	var_dump($xml);*/


/*
	TODO: создать ProductController и два метода showAction    - выводит все товары или по указанной категории,
	                                             productAction - выводит один товар по переданному id
	      http://myshop.local/product/show - показать все товары в магазине
	      http://myshop.local/product/show?category=2 - показать все товары из категории 2
	      
	      http://myshop.local/product/product?id=45643 - вывести всю инфу о товаре по id

*/