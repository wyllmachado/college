no
enable
configure terminal
interface fast 0/0
ip address 10.20.0.1 255.255.254.0
no shutdown

repeat, but to interface fast 0/1

interface eth 0/1/0
ip add 172.16.10.1 255.255.255.255
