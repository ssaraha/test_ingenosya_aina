<?php

namespace App\Helper;

use App\Entity\Ville;

class Helper {

	public function transformVilleInfoToArray(Ville $ville)
	{
		return $arr_car = [
						  	'id' => $ville->getId(),
						  	'name' => $ville->getNom()
						  ];
	}
}