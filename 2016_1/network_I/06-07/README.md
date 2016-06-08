* 2.4. __Efetuar o teste de ping e verificar o resultado__
    - Destination host unreachable / Packets: Sent = 4, Received = 0, Lost = 4 (100% loss)
* 3.4. __Efetuar o teste de ping e verificar o resultado__
    - Packets: Sent = 4, Received = 4, Lost = 0 (0% loss)
* 3.5. __Efetuar o teste de acesso a página WEB e verificar o resultado__
    - Request Timeout
* 5.5. __Efetuar o teste de ping e acesso a pagina WEB do servidor__
    - Packets: Sent = 4, Received = 0, Lost = 4 (100% loss) / Request Timeout
* 6. __Qual é o tipo de ACL que foi utilizada? (OBS: existem 3 tipos: ACL Padrão, ACL Estendida e ACL Nomeada)__
    - estendida numerada de 100-199.
* 7. __Acesse os roteadores LOJA 1 e LOJA 2 e aplique o comando show access-list. Copie e envie o resultado.__
    - Loja 1: 10 permit tcp host 10.1.60.2 host 10.0.10.2 eq ftp (11 match(es))
    - Loja 2: 10 permit icmp host 10.2.50.2 host 10.0.10.2 (4 match(es)) / 20 deny tcp host 10.2.50.2 host 10.0.10.2 eq www (28 match(es))
* 8. __O que significa a palavra “matches” que aparece ao lado de algumas linhas das ACL's?__
    - Significa que bateu ou que foi avaliado.
