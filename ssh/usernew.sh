#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
clear
cdndomain=$(cat /root/awscdndomain)
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domeni=`cat /etc/xray/domain`
else
domeni=`cat /etc/v2ray/domain`
fi
domen=`cat /etc/xray/domain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m            SSH Account            \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

clear
if [[ ! -z "${PID}" ]]; then
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m            SSH Account            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username    : $Login" | tee -a /etc/log-create-user.log
echo -e "Password    : $Pass" | tee -a /etc/log-create-user.log
echo -e "Masa Aktif  : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "IP   : $IP" | tee -a /etc/log-create-user.log
echo -e "Host : $domen" | tee -a /etc/log-create-user.log
echo -e "Port OpenSSH : 22" | tee -a /etc/log-create-user.log
echo -e "Port Ws Ntls : 80" | tee -a /etc/log-create-user.log
echo -e "Port Ws Tls  : 443" | tee -a /etc/log-create-user.log
echo -e "Port SSL/TLS : 443, 777" | tee -a /etc/log-create-user.log
echo -e "Port UDPGW   : 7100-7300" | tee -a /etc/log-create-user.log
echo -e "Port Ssh UDP : 1-65535" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload Websocket" | tee -a /etc/log-create-user.log
echo -e "GET wss://[host]/ [protocol][crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/log-create-user.log
echo -e ""
echo -e "Payload ( Enhanced )" | tee -a /etc/log-create-user.log
echo -e "PATCH / HTTP/1.1[crlf]Host: [host][crlf]Host: bug.com[crlf]Upgrade: websocket[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf][crlf]" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
else
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m            SSH Account            \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Username   : $Login" | tee -a /etc/log-create-user.log
echo -e "Password   : $Pass" | tee -a /etc/log-create-user.log
echo -e "Masa Aktif : $exp" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "IP   : $IP" | tee -a /etc/log-create-user.log
echo -e "Host : $domen" | tee -a /etc/log-create-user.log
echo -e "Port OpenSSH : 22" | tee -a /etc/log-create-user.log
echo -e "Port Ws Ntls : 80" | tee -a /etc/log-create-user.log
echo -e "Port Ws Tls  : 443" | tee -a /etc/log-create-user.log
echo -e "Port SSL/TLS : 443, 777" | tee -a /etc/log-create-user.log
echo -e "Port UDPGW   : 7100, 7200, 7300" | tee -a /etc/log-create-user.log
echo -e "Port Ssh UDP : 1-65535" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
echo -e "Payload Websocket" | tee -a /etc/log-create-user.log
echo -e "GET wss://[host]/ [protocol][crlf]Host: [host][crlf]Upgrade: websocket[crlf][crlf]" | tee -a /etc/log-create-user.log
echo -e ""
echo -e "Payload ( Enhanced )" | tee -a /etc/log-create-user.log
echo -e "PATCH / HTTP/1.1[crlf]Host: [host][crlf]Host: bug.com[crlf]Upgrade: websocket[crlf]Connection: Upgrade[crlf]User-Agent: [ua][crlf][crlf]" | tee -a /etc/log-create-user.log
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press [Enter] Back To Menu"
menu
