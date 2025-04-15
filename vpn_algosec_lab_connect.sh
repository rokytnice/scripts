#!/bin/bash

# VPN Server-URL
VPN_SERVER="91.26.206.232"

# Benutzername und Passwort
VPN_USERNAME="aro"
VPN_PASSWORD="lab@bns3995533!aro"
# VPN-Gruppe (0 für LAB-VPN, 1 für LAB-VPN-MFA)
VPN_GROUP="0"

# Automatische Verbindung mit Zertifikatsbestätigung und Anmeldung
/opt/cisco/secureclient/bin/vpn -s connect $VPN_SERVER << EOF
y
$VPN_GROUP
$VPN_USERNAME
$VPN_PASSWORD
EOF

# Statusmeldung anzeigen
echo "AlogSec Lab VPN-Verbindung hergestellt"
