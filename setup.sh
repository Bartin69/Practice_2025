#!/bin/bash
# setup.sh — hardening Raspberry OS
# Запускать под sudo

echo "[*] Updating system..."
apt update && apt upgrade -y

echo "[*] Adding user and disabling root SSH..."
adduser secureuser
usermod -aG sudo secureuser
sed -i 's/#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart ssh

echo "[*] Setting up UFW firewall..."
apt install ufw -y
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

echo "[*] Installing and configuring Fail2Ban..."
apt install fail2ban -y
cat <<EOF > /etc/fail2ban/jail.local
[sshd]
enabled = true
port    = ssh
logpath = /var/log/auth.log
maxretry = 3
EOF
systemctl restart fail2ban

echo "[*] Disabling unnecessary services..."
systemctl disable avahi-daemon
systemctl stop avahi-daemon

echo "[*] Enabling automatic updates..."
apt install unattended-upgrades -y
dpkg-reconfigure --priority=low unattended-upgrades

echo "[*] Hardening complete. Please reboot and test."
