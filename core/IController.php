<?php

	abstract class IController {

		protected function render(array $args) {
			extract($args);
			$ip = explode(PATH_SEPARATOR,get_include_path());
			
			$fc = FrontController::getInstance();
			$cfg = FrontController::getCfg()["views"];
			$cl = $fc->controller;
			$mt = $fc->method;
			$pref = false;
			$post = false;

			if ( !empty($cfg[$cl][$mt]) ) {
				$clCfg = $cfg[$cl][$mt];
				$renderCtrl = array();
				if( isset($clCfg["prefix"]) ) {
					$renderCtrl = $clCfg["prefix"];
					$pref = true;
				}
				if( isset($clCfg["main"]) ) {
					$renderCtrl = array_merge($renderCtrl,$clCfg["main"]);
				}
				if( isset($clCfg["postfix"]) ) {
					$post = true;
					$renderCtrl = array_merge($renderCtrl,$clCfg["postfix"]);
				}				
			}else {
				$renderCtrl = array("404.tpl");
			}

			if(!$pref) { $renderCtrl = array_merge($cfg["default"]["prefix"],$renderCtrl); }
			if(!$post) { $renderCtrl = array_merge($renderCtrl,$cfg["default"]["postfix"]); }

			ob_start();
			foreach ($renderCtrl as $file) {
				foreach ($ip as $path) {
					if(file_exists($path.DIRECTORY_SEPARATOR.$file)) {
						include $file;
						break;
					}
				}
			}
			return ob_get_clean();

		}



		
	}