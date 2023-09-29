#!/bin/bash
# =====================
zheevpn="https://raw.githubusercontent.com/myzid/v5/main/"
cd

#Install Script Websocket-SSH Python
wget -O /usr/local/bin/ws-openssh ${zheevpn}sshws/openssh-socket.py
wget -O /usr/local/bin/ws-dropbear ${zheevpn}sshws/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel ${zheevpn}sshws/ws-stunnel
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/OPENVPN/ws-ovpn

#izin permision
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-ovpn


#System OpenSSH Websocket-SSH Python
wget -O /etc/systemd/system/ws-openssh.service ${zheevpn}sshws/service-wsopenssh && chmod +x /etc/systemd/system/ws-openssh.service

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service ${zheevpn}sshws/service-wsdropbear && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service ${zheevpn}sshws/ws-stunnel.service && chmod +x /etc/systemd/system/ws-stunnel.service

##System Websocket-OpenVPN Python
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/Tarap-Kuhing/tarong/main/tarong/OPENVPN/ws-ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service

#restart service
#
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service
