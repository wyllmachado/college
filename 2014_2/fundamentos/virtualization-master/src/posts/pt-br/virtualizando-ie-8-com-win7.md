<!--
layout: post
title: Virtualizando IE 8 com Win7
date: 2014-11-24T19:34:36.302Z
comments: true
published: true
keywords:
description:
categories:
-->
Nesse artigo vou mostrar como virtualizar um sistema operacional diferente em sua maquina, o OS que vou rodar é um IE8 em um Win7.

Issa forma de trabalho é muito usada pra servidores terem maior proveito de sua capacidade de memória mas não só isso, como também você poder testar suas aplicações quando não se tem recursos em mãos(ter mac ou linux e precisar do win).


O site que usei para download é o [modern.ie](https://www.modern.ie/pt-br/virtualization-tools#downloads).

Nesse site caso existe um arquivo com extensão txt, o que nos beneficia muito qdo estamos usando sistemas Unix porque existe um comando que se chama __wget__, assim podemos baixar tranquilamente via terminal digitando.

'''
sudo wget -i https://az412801.vo.msecnd.net/vhd/VMBuild_20131127/VirtualBox/IE8_Win7/Linux/IE8.Win7.For.LinuxVirtualBox.txt
'''

Quando o download acabar terá uma lista de arquivos.

![Lista para Download](http://www.robsonjunior.cc/virtualization/img/list.png "Lista para Download")

Após isso vc deve dar os seguintes comandos.

'''
sudo chmod +x IE8.Win7.For.LinuxVirtualBox.part1.sfx
'''
'''
./IE8.Win7.For.LinuxVirtualBox.part1.sfx
'''

O primeiro está dando permissão de execusão, segundo esta executando o arquivo que depois será criado nesse diretório um outro arquivo chamado __IE8 - Win7.ova__.

Vá até o diretório e dê dois cliques nesse arquivo.
Irá pedir o que você deseja fazer, como mostra a figura a baixo.

![Importando Imagem](http://www.robsonjunior.cc/virtualization/img/import.png "Importando Imagem")

Ali se pode escolher as configurações que deseja usar, no meu caso estou disponibilizando apenas 512mb de RAM.

Dando import ele irá começar importar e instalar o OS e como nesse caso estou usando um pacote para rodar IE8 ele já me vem instalado.

![Andamento do download](http://www.robsonjunior.cc/virtualization/img/import-percent.png "Andamento do download")

Com isso você está pronto pra usar o Windows já com seu IE instalado e basta dar o click mágico no __Start__ que mostra a figura abaixo.

![Iniciando serviço](http://www.robsonjunior.cc/virtualization/img/start.png "Iniciando serviço")

Pronto, agora você tem um Windows rodando em uma máquina Ubuntu 14.10 ou onde desejar.

![Serviço sendo rodado](http://www.robsonjunior.cc/virtualization/img/run.png "Serviço sendo rodado")