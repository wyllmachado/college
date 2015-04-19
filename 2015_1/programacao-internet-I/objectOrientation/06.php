<?php


/**
* @description:	Leia 5 valores para uma variável A .
*				A seguir mostre quantos valores digitados foram pares,
* 				quantos valores digitados foram ímpares, quantos foram positivos e quantos foram negativos.
**/

class CalculeQtd {
	public function even ($arr, $arrLen) {
		$even = 0;

		for ($i = 0; $i < $arrLen; $i++) {
			if ($arr[$i] % 2 === 0) {
				$even++;
			}
		}

		return $even;
	}

	public function odd ($arr, $arrLen) {
		$odd = 0;

		for ($i = 0; $i < $arrLen; $i++) {
			if ($arr[$i] % 2 !== 0) {
				$odd++;
			}
		}

		return $odd;
	}

	public function negative ($arr, $arrLen) {
		$negative = 0;

		for ($i = 0; $i < $arrLen; $i++) {
			if ($arr[$i] < 0) {
				$negative++;
			}
		}

		return $negative;
	}

	public function positive ($arr, $arrLen) {
		$positive = 0;

		for ($i = 0; $i < $arrLen; $i++) {
			if ($arr[$i] >= 0) {
				$positive++;
			}
		}

		return $positive;
	}
}

$calcule = new CalculeQtd();
$arr = array(-1, 2, 3, 4, 5);
$arrLen = sizeof($arr);

echo ' par: ' . $calcule->even($arr, $arrLen);
echo '</br>';
echo ' impar : ' . $calcule->odd($arr, $arrLen);
echo '</br>';
echo ' negativo: ' . $calcule->negative($arr, $arrLen);
echo '</br>';
echo ' positivo: ' . $calcule->positive($arr, $arrLen);


?>