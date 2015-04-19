<?php
/**
* @description: A fórmula para calcular a área de uma circunferência é: A = πR2.
*				Sendo que o valor de π = 3.14159 basta estabelecer:
*				Ler 1 valor para raio, no caso a variável R. Efetuar o cálculo da área,
*				elevando o valor de R ao quadrado e multiplicando por π.
*				Apresentar o valor da variável A.
**/

class Calule {
	public function circunference ($ray) {
		return pow($ray, 2) * pi();
	}
}

$ex = new Calule();
echo 'Resultado: ' . $ex->circunference(5);

?>