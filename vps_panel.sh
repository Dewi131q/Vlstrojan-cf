#!/bin/bash

# VPS Panel Script
# Version 1.0

# --- Globals ---
IP_VPS="123.456.789.0"
ISP="Indihome / Biznet"
DOMAIN="vpn.example.com"
RAM="512MB / 1GB"
CPU_CORES="1 Core"
UPTIME="2 days 3 hours"

# --- Functions ---
check_service_status() {
    service_name=$1
    if systemctl is-active --quiet "$service_name"; then
        echo "[✔]"
    else
        echo "[X]"
    fi
}

show_menu() {
    clear
    echo "==================================="
    echo "   ⚙️  VPS PANEL - VPN MANAGER v1.0"
    echo "==================================="
    echo " 🖥️  IP VPS     : $IP_VPS"
    echo " 📡  ISP        : $ISP"
    echo " 🌐  Domain     : $DOMAIN"
    echo " 🧠  RAM        : $RAM"
    echo " 🧮  CPU Cores  : $CPU_CORES"
    echo " 🧾  Uptime     : $UPTIME"
    echo " 🧠 Pembuat Script"
    echo ""
    echo "==================================="
    echo " ✅ ACTIVE VPN ACCOUNTS"
    echo "----------------------------------------"
    echo " 🔐 SSH       : user aktif"
    echo " 💠 VMess  : user aktif"
    echo " 💠 VLESS   : user aktif"
    echo " 🔐 Trojan   : user aktif"
    echo "==================================="
    echo " 📋 SERVICE STATUS"
    echo "==================================="
    echo " 🔵 Nginx       : $(check_service_status nginx)"
    echo " 🔵 Dropbear    : $(check_service_status dropbear)"
    echo " 🔵 Xray Core   : $(check_service_status xray)"
    echo " 🔵WebSocket : $(check_service_status websocket)"
    echo " 🔵 Stunnel5    : $(check_service_status stunnel5)"
    echo " 🔵 Squid       : $(check_service_status squid)"
    echo " 🔵 OpenVPN     : $(check_service_status openvpn)"
    echo "==================================="
    echo " 📌 MAIN MENU"
    echo "==================================="
    echo " [1]  SSH Account Manager"
    echo " [2]  VLESS Account Manager"
    echo " [3]  VMess Account Manager"
    echo " [4]  Trojan Account Manager"
    echo " [5]  Change Domain"
    echo " [6]  Change Banner"
    echo " [7]  Check Port Status"
    echo " [8]  Restart All Services"
    echo " [9]  Show All Active Accounts"
    echo "==================================="
    echo " [0]  Exit"
    echo "==================================="
}

ssh_account_manager() {
    echo "SSH Account Manager"
}

vless_account_manager() {
    echo "VLESS Account Manager"
}

vmess_account_manager() {
    echo "VMess Account Manager"
}

trojan_account_manager() {
    echo "Trojan Account Manager"
}

change_domain() {
    echo "Change Domain"
}

change_banner() {
    echo "Change Banner"
}

check_port_status() {
    echo "Check Port Status"
}

restart_all_services() {
    echo "Restart All Services"
}

show_all_active_accounts() {
    echo "Show All Active Accounts"
}

# --- Main ---
main() {
    while true; do
        show_menu
        read -p "Enter your choice [0-9]: " choice
        case $choice in
            1) ssh_account_manager ;;
            2) vless_account_manager ;;
            3) vmess_account_manager ;;
            4) trojan_account_manager ;;
            5) change_domain ;;
            6) change_banner ;;
            7) check_port_status ;;
            8) restart_all_services ;;
            9) show_all_active_accounts ;;
            0) exit 0 ;;
            *) echo "Invalid option" ;;
        esac
        read -p "Press Enter to continue..."
    done
}

main "$@"
