# NodeJS - JavaScript server side

O JavaScript por muito tempo foi conhecido como aquela linguagem para validação de formulários em páginas web.
Hoje, essa brincadeira já mais feita devido a sua grande evolução ao passar os anos 2.000.

## Descrição
O __NodeJS__ foi criado em 2009 por _Ryan Dahl_ e até hoje é mentido pela empresa
Joyent onde o mesmo trabalha. Como principal motivo, o NodeJS foi desenvolvido para saber lidar
com milhões de conexões simultaneas na mesma máquina, isso ajudaria muito na eocomia de infra e também os programadores
para lidarem com escalabilidade.

## De scripter para scripter
O NodeJS roda por baixo o V8 que é uma JavaScript Engine (interpretador JavaScript). Esse motor V8 foi desenvolvido pelo Google e hoje 
é totalmente OpenSource.

A facilidade de construir programar para servidores web faz parecer muito similar com __PHP__, porém a grande diferença entre NodeJS e PHP
é que a maioria das funções do PHP são bloqueantes(um comando só pode ser executado após comando anterior ter finalizado) enquanto funções NodeJS
são não-bloqueantes(comandos são executadoes em paralelo, e usado uma callback para sinalizar se completou ou se falhou).
Resumindo o NodeJS junta a facilidade da linguagem junto com todo poder de um servidor.

## Arquitetura
... NodeJs trás consigo 5o conceito de __programação orientada a eventos__ para os servidores web. Isso facilita no dia a dia dos
desenvolvedores a não precisarem mais trabalhar se preocupando com o uso de treads, tudo isso porque programação orientada a eventos usa callbacks para avisar o final da tarefa.
O fato de NodeJS ser buildado vom o V8 ele é muito eficiente em trabalhar com protocolos como HTTP, DNS, TCP.

## Gerenciador de pacotes
__npm__ é o gerenciador de pacotes do NodeJS, usado para instalar programas, módulos, apps e qualquer outra coisa que esteja registrado na npm.


