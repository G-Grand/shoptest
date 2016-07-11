<?php

	class ProductController extends IController {

		public function showAction() {
			$category = (!empty($_GET['category'])) ? $_GET['category'] : null;
			$category = ((int) $category) ? (int) $category : null;

			$products = (!$category) ? ProductHandler::getAllProducts() : ProductHandler::getProductsByCategory($category);
			
			return $this->render(["products"=>$products]);

		}

		public function productAction() {
			echo "Мы в productAction класса ProductController =)";
		}

		

	}