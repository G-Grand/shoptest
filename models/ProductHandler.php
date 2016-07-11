<?php

class ProductHandler {
	
	static public function getProductsByCategory($category) {
		$conn = DBConn::getInstance()->getConn();
		$selectAllCategories = "select id from category where categor_id = :id";
		$stmt = $conn->prepare($selectAllCategories);
		$stmt->execute([":id" => $category]);
		
		$ids = [$category];
		$cnt = "?,";
		while($r = $stmt->fetch(PDO::FETCH_NUM)) {
			$ids[] = (int) $r[0];
			$cnt .= "?,";
		}

		$selectProd = "select p.id,p.name,c.name as categor_id,p.producer_id,p.measur_id from product as p,  category as c
		               where p.categor_id = c.id AND p.categor_id in(".trim($cnt,",").")";
		$stmt = $conn->prepare($selectProd);
		$stmt->execute($ids);
		return $stmt->fetchAll(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,"Product");
	}

	static public function getAllProducts() {
		$conn = DBConn::getInstance()->getConn();
		$select = "select * from product";
		$res = $conn->query($select);
		return $res->fetchAll(PDO::FETCH_CLASS|PDO::FETCH_PROPS_LATE,"Product");
	}

}