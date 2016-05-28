1. __Qual a camada do modelo OSI em que o roteador opera e por quê?__
    - Camada de rede
2. __O  comando ping é comumente utilizado para verificar o funcionamento de qualquer dispositivo em uma rede.__
    - 2.1. __A partir do prompt da “ESTAÇÃO MATRIZ”, verifique o funcionamento da “ESTAÇÃO 1 LOJA 2” emitindo o comando ping 10.2.40.2.__
    - 2.2. __A partir do prompt da “ESTAÇÃO 1 LOJA 1”, verifique o funcionamento da “ESTAÇÃO 1 LOJA 2” emitindo o comando ping 10.2.40.2.__
    - __Analise os resultados e responda__
    - 2.3. __O significa TTL?__
        - Time to live (tempo de vida)
    - 2.4. __O campo TTL pertence a qual cabeçalho?__
        - Está no primeiro octeto, faz parte do cabeçalho de IP.
    - 2.5. __O que acontece quando o valor de TTL é igual a zero?__
        - Descarta o pacote
3. __Roteadores utilizam uma tabela de roteamento par a tomar as decisões de encaminhamento  dos  pacotes:  No  roteador  “MATRIZ”, execute  na  CLI  o  comando show ip route para visualizar a tabela de roteamento.__
    - 3.1. __O que significa a letra “O” que aparece na coluna esquerda? Explique.__
        - Significa que está dentro da mesma área que foi originado em algum outro OSPF.
    - 3.2. __O que significa a letra “C” que aparece na coluna esquerda? Explique.__
        - É o código para redes conectada diretamente.
4. __Nos roteadores LOJA 1 e LOJA 2, acesse a aba CLI e execute o comando show ip
route e compare os resultados.__
    - 4.1. __Por que a tabela de roteamento do roteador LOJA 1 é diferente da tabela de roteamento do roteador LOJA 2?__
        - Porque são redes diferentes, o que se conecta diretamente em uma na outra será via OSPF.
5. __A topologia apresentada possui um certo nível de redundância, ou seja, caso algum dos links entre os roteadores falhe ainda será possível acessar o destino escolhido. A partir do prompt de comando da “ESTAÇÃO 1 LOJA 1”, execute o comando tracert 10.2.40.2.__
    - 5.1. __Qual a função do comando tracert?__
        - Mostra por onde o nosso ping passou.
    - 5.2. __Anote o resultado do comando.__
        - Percorreu o caminho 10.1.40.1, 200.198.104.10 e finalmente chegando ao 10.2.40.2.
    - 5.3. __Explique o resultado do comando.__
        - Nos da toda a caminhada do pacote, dizendo por onde foi todo seu trajeto.
    - 5.4. __Anote o resultado do comando.__
        - 1   0 ms      0 ms      1 ms      10.1.40.1
          2   0 ms      1 ms      0 ms      200.198.104.1
          3   0 ms      1 ms      0 ms      200.198.104.6
          4   2 ms      0 ms      0 ms      10.2.40.2
    - 5.5. __Compare com o resultado obtido no item 5.2.__
        - O roteador intemediário entre redes agora foi o da triangulação de cima.
    - 5.6. __Por que os resultados obtidos são diferentes?__
        - Como temos uma triangulação, e tirando o cabo direto entre as redes, o entermediário ainda consegue entregar.
6. __A partir do prompt da “ESTAÇÃO 1 LOJA 1”, verifique o funcionamento da estação “ESTAÇÃO 1 LOJA 2” emitindo o comando ping 10.2.40.2.__
    - 6.1. __O valor de TTL é o mesmo obtido no item 2.2? Explique.__
        - 
