<?php

return array(
	'DBConnection' => array(
		'host' => 'localhost',
		'name' => 'shop',
		'user' => 'root',
		'pass' => ''
	),
	'include_path' => array(
		"controllers/",
		"core/",
		"models/",
		"views/"
	),
	'views' => array(
		'default' => array(
			'prefix' => array("header.tpl"),
			'postfix' => array("footer.tpl")
		),
		'ProductController' => array(
			"showAction" => array(
				'main' => array("products.tpl"),
				'postfix' => array()
			)
		)
	)
);