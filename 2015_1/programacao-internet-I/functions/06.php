<?php


/**
* @description:	Leia 5 valores para uma variável A .
*				A seguir mostre quantos valores digitados foram pares,
* 				quantos valores digitados foram ímpares, quantos foram positivos e quantos foram negativos.
**/

$even = 0; // par
$odd = 0; // impar
$positive = 0;
$negative = 0;
$arr = array(-1, 2, 3, 4, 5);
$arrLen = sizeof($arr);

for ($i = 0; $i < $arrLen; $i++) {
	$n = $arr[$i];

	// verifica se pos ou neg
	if ($n > 0) {
		$positive++;
	} else {
		$negative++;
	}

	// verifica se par ou impar
	if ($n % 2 === 0) {
		$even++;
	} else {
		$odd++;
	}
}

echo ' par: ' . $even;
echo '</br>';
echo ' impar :' . $odd;
echo '</br>';
echo ' negativo: ' . $negative;
echo '</br>';
echo ' positivo: ' . $positive;

?>