# Obtener la dirección IP de la interfaz eth0
ip_address=$(ifconfig tun0 | grep -oP '(?<=inet )(\d+\.\d+\.\d+\.\d+)')

# Copiar la dirección IP al portapapeles
echo -n "$ip_address" | xclip -selection clipboard
