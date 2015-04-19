<?php


/**
* @description: Faça um algoritmo que leia 4 variáveis A,B,C e D. A seguir,
*				se B for maior do que C e se D for maior do que A e a
*				soma de C com D for maior que a soma de A e B e se C e D,
* 				ambos, forem positivos e se a variável A for par escrever a
*    			mensagem “valores aceitos”, senão escrever “valores não aceitos” 
**/

function crazyCalcule ($n1, $n2, $n3, $n4) {
	if ($n3 < 0 || $n4 < 0) {
		return 'Valores nao aceitos';				
	}

	if (
		$n2 > $n3 &&
		$n4 > $n1 &&
		$n1 % 2 === 0 &&
		($n3 + $n4) > ($n1 + $n2)
	){
		return 'Valores aceitos';
	}

	return 'Nem entrou em alguma condicao';
};

$crazyCalcule = crazyCalcule(2, 4, 3, 4);

echo 'Resultado: ' . $crazyCalcule;


?>