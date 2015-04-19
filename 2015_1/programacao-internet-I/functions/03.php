<?php


/**
* @description: Leia duas variáveis A e B. A seguir,
*				calcule o produto entre elas e atribua à variável PROD.
*				A seguir mostre a variável PROD com mensagem correspondente.
**/

function product($n1, $n2) {
	return pow($n1 + $n2, 2);
};

$product = product(2, 3);

echo 'Resultado: ' . $product;


?>