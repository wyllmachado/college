<?php


/**
* @description: Faça um algoritmo que leia 5 conjuntos de 2 valores,
*				o primeiro representando o número de um aluno e
*				o segundo representando a sua altura em centímetros.
*				Encontrar o aluno mais alto e mais baixo e 	mostrar seus números e suas alturas,
*				dizendo se o aluno é o mais alto ou é o mais baixo.
**/

$arr1 = array('aspiraAlucinado', 'jesus', 'mouraReclamao', 'betoMetal', 'jeptchong');
$arr2 = array(187, 170, 186, 184, 190);
$lt = 0;
$gt = 0;

for ($i = 0; $i < 5; $i++) {

	if ($i === 0) {
		$lt = $arr2[$i];
		$gt = $arr2[$i];
	} else {
		if ($arr2[$i] <= $lt) {
			$lt = $arr2[$i];
			$ltIndex = $i;
		} else {
			$gt = $arr2[$i];
			$gtIndex = $i;
		}
	}
}

echo 'Maior pessoa: '. $arr1[$gtIndex] . ' = ' . $gt;
echo '</br>';
echo 'Menor pessoa: '. $arr1[$ltIndex] . ' = ' . $lt;

?>