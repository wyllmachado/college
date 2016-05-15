# Trabalho prático dia 10/05/2016

1. __Qual a camada do modelo OSI em que o switch opera?__
    - O switch trabalha na camada de enlace pq trabalha com os endereços MAC
2. __Os switches tratam os endereços físicos. Qual é o nome desses endereços? Escreva
um endereço como exemplo.__
    - 20:AA:4B:CC:67:30
3. __Quando as máquinas necessitam se comunicar em uma rede elas fazem uso de um
protocolo que associa endereço físico ao endereço lógico. Qual o nome desse
protocolo?__
    - Protocolo ARP
4. __O que faz o comando arp –a ?__
    - Exibe e modifica entradas no cache do protocolo de resolução de endereços (ARP), contendo uma ou mais tabelas que são 
usadas para armazear endereços IP e seus endereços físicos.
5. __A partir de uma estação de trabalho aplique o comando arp –a e responda: Por que a
estação de trabalho não conhece todos os endereços físicos e lógicos das demais
estações?__
    - Por que ele ainda não aprendeu todos endereços da rede.
6. __A partir do switch 1, emita o comando: show mac address-table. O que esse comando
faz? Copie o resultado do comando.__
    - Mostra a tabela com os endereços aprendidos.
            Mac Address Table
    -------------------------------------------

    Vlan    Mac Address       Type        Ports
    ----    -----------       --------    -----

       1    000d.bd6c.3101    DYNAMIC     Fa0/24
       1    0090.2b34.2418    DYNAMIC     Fa0/1
7. __A partir do roteador, emita o comando: show ip arp. O que esse comando faz? Copie o
resultado do comando.__
    - Mostra a reolução do Protocolo ARP
    Protocol  Address          Age (min)  Hardware Addr   Type   Interface
    Internet  10.254.0.1              -   000D.BD6C.3101  ARPA   FastEthernet0/0
8. __Gere tráfego entre todas as estações (ping) e para o roteador. Repita os
procedimentos dos itens 5, 6 e 7. O que mudou no resultado? Copie os resultados e
compare.__
    - Internet Address      Physical Address      Type
      10.254.0.1            000d.bd6c.3101        dynamic
      10.254.0.20           000c.cf14.a80c        dynamic
      10.254.0.30           000a.4100.5a3e        dynamic
      10.254.0.40           0090.214b.5e8d        dynamic
      10.254.0.50           0001.9714.50b9        dynamic
      10.254.0.100          0007.ec9e.d8d8        dynamic
	- Mac Address Table
	------------------------------------------
	Vlan    Mac Address       Type        Ports
	----    -----------       --------    -----
	   1    0001.9714.50b9    DYNAMIC     Fa0/1
	   1    0001.c94d.7c69    DYNAMIC     Fa0/4
	   1    0007.ec9e.d8d8    DYNAMIC     Fa0/1
	   1    000a.4100.5a3e    DYNAMIC     Fa0/5
	   1    000c.cf14.a80c    DYNAMIC     Fa0/2
	   1    000d.bd6c.3101    DYNAMIC     Fa0/24
	   1    0090.214b.5e8d    DYNAMIC     Fa0/1
	   1    0090.2b34.2418    DYNAMIC     Fa0/1
	- Protocol  Address          Age (min)  Hardware Addr   Type   Interface
	  Internet  10.254.0.1              -   000D.BD6C.3101  ARPA   FastEthernet0/0
	  Internet  10.254.0.10             2   0001.C94D.7C69  ARPA   FastEthernet0/0
9. __A partir do switch 1 e no switch 2: Por que algumas portas possuem mais de um
endereço físico e outras apenas um endereço?__
	- não entendi a pergunta
10. __Faça a seguinte analise:__
    - __A partir do roteador, execute o comando ping para o endereço IP do servidor e descubra o seu endereço físico.__
		- 0007.EC9E.D8D8 
    - __No switch 1, em quais portas o endereço físico do servidor está presente?__
		- não sei
    - __No switch 2, em quais portas o endereço físico do servidor está presente?__
		- não sei
    - __Explique os resultado.__
		- não sei explicar
