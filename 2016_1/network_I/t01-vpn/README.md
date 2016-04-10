# VPN 

## O que é VPN?
VPN, do ingês(_virtual private network_), ou seja __Rede Virual Privada__.
A VPN nos permite criar acesso restrito a uma máquina caso tenha as credenciais necessárias.

A VPN é uma conexão estabelecida usando tecnologias de tunelamento que fornecem a segurança do
conteúdo trafegado.

### Segurança
Uma vez implemntado os protocolos da forma correta, podem dar segurança em redes totalmente inseguras.


## Para que serve?
Serve como um modo de segurança, tem como objetivo ligar dois computadores. Para simbolizar com a vida real
seria como um tunel que liga uma estrada a outra,
quem está de fora desse túnel não irá conseguir enxergar o que está dentro.
O uso de VPN pode ser usado também para acessar conteúdos bloqueados em determinadas
redes ou forçar navegaçao como se estivesse em outro país.


## Onde é utilizado?
Geralmente empresas onde tem funcionários que viajam, trabalham remotamente ou que precisam de alguma forma dar acesso externo.
Podemos fazer uma __VPN__ como _Extranet_ ou _Intranet_.

A baixo segue ambas características.

### Intranet VPN / Extranet VPN
Tem como objetivo ligar dois pontos remotos à uma rede interna da matriz através de uma infraestrutura compartilhada que usa 
conexões dedicadas, assim o acesso fica restrito somente as pessoas daquela rede.

A diferença das duas é que a _Intranet_ pode ser usada apenas por quem está dentro da empresa e a _Extranet_ por ser conectada por pessoas
extenas.


## Protocolos envolvidos
* PPTP
    - __(Point-to-Point Tunneling Protocol)__,
    traduzindo para o português ficara __Protocolo de Tunelamento Ponto a Ponto__.
    Esse protocolo foi desenvolvido por um fórum de empresas.
    Numa conexão PPTP, existem três elementos envolvidos: o Cliente PPTP, o Servidor de Acesso a
    Rede (NAS - Network Acess Server) e o Servidor PPTP. O cliente se conecta a um NAS, através de
    um PoP em um ISP local. Uma vez conectado, o cliente pode enviar e receber pacotes via Internet.
    O NAS utiliza TCP/IP para todo o tráfego de Internet. Depois do cliente ter feito a conexão
    PPP inicial com o ISP, uma segunda chamada dial-up é realizada sobre a conexão PPP existente.
    Os dados desta segunda conexão são enviados na forma de datagramas IP que contém pacotes PPP encapsulados.
    É esta segunda conexão que cria o túnel com o servidor PPTP nas imediações da LAN corporativa privada.
* L2TP
    - Possui praticamente a mesma  funcionalidade do protocolo __PPTP__ que destinam-se a implementar um _Virtual Private Dial Network (VPDN)_,
    uma ligação segura, temporária, com início e fim determinados pela sessão do utilizador.
    O __L2TP__ permite que uma estação de trabalho __PPP__ e um dispositivo a operar ao nível da ligação de dados residam em redes distintas,
    interligadas por uma rede de comutação de pacotes.
    Uma ligação __L2TP__ envolve dois componentes – o __L2TP__ Acess Concentrator (LAC), instalado no cliente,
    e o L2TP Network Server __(LNS)__, no lado do servidor.
    Tal como no __PPTP__, recorre a um canal de controlo não exige uma ligação __TCP__ autónoma.
    O túnel __L2TP__, é construído sobre __UDP__ (porto 1701).
* SSTP
    - O protocolo SSTP é um novo protocolo de encapsulamento que usa o protocolo HTTPS pela porta TCP 443 para possibilitar
    o fluxo do tráfego pelos firewalls e proxies da Web que poderiam bloquear o tráfego PPTP e L2TP/IPsec.
    O SSTP oferece um mecanismo de encapsulamento do tráfego PPP sobre o canal do protocolo SSL do protocolo HTTPS.
    O uso do PPP possibilita o suporte a métodos de autenticação fortes, como o EAP-TLS. O SSL oferece segurança no nível
    de transporte com verificação avançada da negociação, criptografia e integridade da chave.
    Quando um cliente tenta estabelecer uma conexão VPN baseada em SSTP,
    o SSTP primeiro estabelece uma camada HTTPS bidirecional com o servidor SSTP. Por essa camada HTTPS,
    o protocolo empacota o fluxo como a carga de dados.
* IPSec
    - É uma extenção do protocolo IP. Tem como objetivo ser o método padrão para o fornecimento de privacidade ao usuário, aumento a
    confiabilidade e integridade da informação. __IPsec__ é considerado uma suíte de protocolos que nos dá segurança na camada de rede (ou camada 3)
    do modelo OSI. Outros protocolos de segurança da internet como SSL e TLS operam desde a camada de transporte (camada 4) até a camada de aplicação (camada 7).
    Esse tipo de implementação evita ataques como _man in the middle_, algorítimos para cálculos de _hash_ como utilização de chavez.


### Fontes
- http://www.tecmundo.com.br/1427-o-que-e-vpn-.htm
- https://pt.wikipedia.org/wiki/Virtual_private_network
- http://www.techtudo.com.br/noticias/noticia/2015/11/o-que-e-vpn-saiba-tudo-sobre-rede-virtual-privada.html
- https://technet.microsoft.com/pt-br/library/cc771298(v=ws.10).aspx
- http://pontoderedes.blogspot.com.br/2011/11/point-to-point-tunneling-protocol-pptp.html
- http://faqinformatica.com/vpns-de-nivel-2-pptp-l2f-l2tp/
- https://technet.microsoft.com/pt-br/library/cc771298(v=ws.10).aspx
- https://pt.wikipedia.org/wiki/IPsec
