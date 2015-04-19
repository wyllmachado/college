<?php
/**
* @description: Leia duas variáveis A e B. A seguir,
*				calcule o produto entre elas e atribua à variável PROD.
*				A seguir mostre a variável PROD com mensagem correspondente.
**/
class Calcule {
	public function product () {
		return pow($n1 + $n2, 2);
	}
}

$calcule = new Calcule();
echo 'Resultado: ' . $calcule->product(2, 3);

?>