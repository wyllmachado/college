enable: deixa como root para setarmos as configurações
conf t: coloca em modo de configuração

# config
interface fast [0/0 (ou a que está)] = active interface
ip address 192.168.0.1 255.255.255.0 = set ip and mask
no shut = set config
exit = exit menu
wr = salve

