<?php

class Product {
	private $id;
	private $name;
	private $categor_id;
	private $producer_id;
	private $measur_id;
	private $price;


	public function setId($id)             {         $this->id = $id;       }
	public function setName($name)         {       $this->name = $name;     }
	public function setCategory($category) { $this->categor_id = $category; }
	public function setProducer($producer) {$this->producer_id = $producer; }
	public function setMeasur($measur)     {  $this->measur_id = $measur;   }
	public function setPrice($price)       {      $this->price = $price;    }

    public function       getId() { return $this->id;          }
	public function     getName() { return $this->name;        }
	public function getCategory() { return $this->categor_id;  }
	public function getProducer() { return $this->producer_id; }
	public function   getMeasur() { return $this->measur_id;   }
	public function    getPrice() { return $this->price;       }
}