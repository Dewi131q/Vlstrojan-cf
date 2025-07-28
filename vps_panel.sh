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
BANNER="⚙️  VPS PANEL - VPN MANAGER v1.0"

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
    echo "   $BANNER"
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
    clear
    echo "==================================="
    echo "   SSH Account Manager"
    echo "==================================="
    echo " [1] Create SSH Account"
    echo " [2] Delete SSH Account"
    echo " [3] View SSH Accounts"
    echo " [0] Back to Main Menu"
    echo "==================================="
    read -p "Enter your choice [0-3]: " choice
    case $choice in
        1) create_ssh_account ;;
        2) delete_ssh_account ;;
        3) view_ssh_accounts ;;
        0) return ;;
        *) echo "Invalid option" ;;
    esac
}

create_ssh_account() {
    echo "Create SSH Account"
}

delete_ssh_account() {
    echo "Delete SSH Account"
}

view_ssh_accounts() {
    echo "View SSH Accounts"
}

vless_account_manager() {
    clear
    echo "==================================="
    echo "   VLESS Account Manager"
    echo "==================================="
    echo " [1] Create VLESS Account"
    echo " [2] Delete VLESS Account"
    echo " [3] View VLESS Accounts"
    echo " [0] Back to Main Menu"
    echo "==================================="
    read -p "Enter your choice [0-3]: " choice
    case $choice in
        1) create_vless_account ;;
        2) delete_vless_account ;;
        3) view_vless_accounts ;;
        0) return ;;
        *) echo "Invalid option" ;;
    esac
}

create_vless_account() {
    echo "Create VLESS Account"
}

delete_vless_account() {
    echo "Delete VLESS Account"
}

view_vless_accounts() {
    echo "View VLESS Accounts"
}

vmess_account_manager() {
    clear
    echo "==================================="
    echo "   VMess Account Manager"
    echo "==================================="
    echo " [1] Create VMess Account"
    echo " [2] Delete VMess Account"
    echo " [3] View VMess Accounts"
    echo " [0] Back to Main Menu"
    echo "==================================="
    read -p "Enter your choice [0-3]: " choice
    case $choice in
        1) create_vmess_account ;;
        2) delete_vmess_account ;;
        3) view_vmess_accounts ;;
        0) return ;;
        *) echo "Invalid option" ;;
    esac
}

create_vmess_account() {
    echo "Create VMess Account"
}

delete_vmess_account() {
    echo "Delete VMess Account"
}

view_vmess_accounts() {
    echo "View VMess Accounts"
}

trojan_account_manager() {
    clear
    echo "==================================="
    echo "   Trojan Account Manager"
    echo "==================================="
    echo " [1] Create Trojan Account"
    echo " [2] Delete Trojan Account"
    echo " [3] View Trojan Accounts"
    echo " [0] Back to Main Menu"
    echo "==================================="
    read -p "Enter your choice [0-3]: " choice
    case $choice in
        1) create_trojan_account ;;
        2) delete_trojan_account ;;
        3) view_trojan_accounts ;;
        0) return ;;
        *) echo "Invalid option" ;;
    esac
}

create_trojan_account() {
    echo "Create Trojan Account"
}

delete_trojan_account() {
    echo "Delete Trojan Account"
}

view_trojan_accounts() {
    echo "View Trojan Accounts"
}

change_domain() {
    read -p "Enter new domain: " new_domain
    DOMAIN=$new_domain
    echo "Domain has been changed to $DOMAIN"
}

change_banner() {
    read -p "Enter new banner: " new_banner
    BANNER=$new_banner
    echo "Banner has been changed to $BANNER"
}

check_port_status() {
    clear
    echo "==================================="
    echo "   Check Port Status"
    echo "==================================="
    echo "SSH Port (22): $(netstat -tulpn | grep :22)"
    echo "Dropbear Port (109, 143): $(netstat -tulpn | grep -E ':109|:143')"
    echo "Stunnel5 Port (443, 777): $(netstat -tulpn | grep -E ':443|:777')"
    echo "Squid Port (8080, 3128): $(netstat -tulpn | grep -E ':8080|:3128')"
    echo "OpenVPN Port (1194): $(netstat -tulpn | grep :1194)"
    echo "Xray VLESS Port (443): $(netstat -tulpn | grep :443)"
    echo "Xray VMess Port (443): $(netstat -tulpn | grep :443)"
    echo "Xray Trojan Port (443): $(netstat -tulpn | grep :443)"
    echo "==================================="
}

restart_all_services() {
    clear
    echo "==================================="
    echo "   Restarting All Services"
    echo "==================================="
    systemctl restart nginx
    systemctl restart dropbear
    systemctl restart xray
    systemctl restart websocket
    systemctl restart stunnel5
    systemctl restart squid
    systemctl restart openvpn
    echo "All services have been restarted."
    echo "==================================="
}

show_all_active_accounts() {
    clear
    echo "==================================="
    echo "   All Active Accounts"
    echo "==================================="
    view_ssh_accounts
    view_vless_accounts
    view_vmess_accounts
    view_trojan_accounts
    echo "==================================="
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
