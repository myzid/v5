#!/bin/bash

user="$2"
function ssh(){
	getent passwd ${user}  >/dev/null 2>&1
	userdel -f ${user}  >/dev/null 2>&1
	systemctl restart sshd >/dev/null 2>&1
	systemctl restart ws >/dev/null 2>&1
}
function vmess(){
    exp=$(grep -wE "^### $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^### $user $exp/,/^},{/d" /etc/vmess/.vmess.db
	sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
	sed -i "/^### $user $exp/,/^},{/d" /etc/xray/config.json
}
function vless(){
    exp=$(grep -wE "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^#& $user $exp/,/^},{/d" /etc/vless/.vless.db
	sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
	sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
}
function trojan(){
    exp=$(grep -wE "^#! $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
	sed -i "/^#! $user $exp/,/^},{/d" /etc/trojan/.trojan.db
	sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
	sed -i "/^#! $user $exp/,/^},{/d" /etc/xray/config.json
}
if [[ ${1} == "vmess" ]]; then
vmess
elif [[ ${1} == "vless" ]]; then
vless
elif [[ ${1} == "trojan" ]]; then
trojan
elif [[ ${1} == "ssh" ]]; then
ssh
fi
