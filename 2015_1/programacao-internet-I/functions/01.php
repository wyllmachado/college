<?php


/**
* @description: Ler 2 valores, no caso variáveis A e B. Efetuar a soma das variáveis
* 				A e B implicando seu resultado na variável X.
* 				Apresentar o valor da variável X
* 				após a soma dos dois valores indicados.
**/

function sum ($n1, $n2) {
	$result = $n1 + $n2;

	return $result;	
};

$sumNumbers = sum(2, 5);

echo 'Resultado: ' . $sumNumbers; 

	
?>