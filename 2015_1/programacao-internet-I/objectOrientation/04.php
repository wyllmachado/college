<?php


/**
* @description: Leia 2 variáveis A e B, que correspondem a 2 notas de um aluno.
*				A seguir, calcule a média do aluno.
**/
class Calcule {
	public function media ($n1, $n2) {
		return ($n1 + $n2) / 2;
	}
}

$calcule = new Calcule();
echo 'Resultado: ' . $calcule->media(6, 9);


?>