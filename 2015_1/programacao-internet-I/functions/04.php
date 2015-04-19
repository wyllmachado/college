<?php


/**
* @description: Leia 2 variáveis A e B, que correspondem a 2 notas de um aluno.
*				A seguir, calcule a média do aluno.
**/

function media($n1, $n2) {
	return ($n1 + $n2) / 2;
};

$media = media(6, 9);

echo 'Resultado: ' . $media;


?>