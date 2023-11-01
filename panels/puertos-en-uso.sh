#!/bin/bash
netstat -tunap |grep "LISTEN\|ESTABLISHED"|grep "tcp\|tcp6"|awk '{print $4, $6, $7}' > /home/kali/.config/panels/puertos-abiertos.txt

listapuertos="/home/kali/.config/panels/puertos-abiertos.txt"
separador=" : "
while read -r lineaquelee
do
    linea=$lineaquelee
    puertos=$(echo $linea | grep -o ':[0-9]*'|grep -o '[0-9]*')
    estado=$(echo $linea | awk -F ' ' '{print $2}')
    servicio=$(echo $linea | grep -o '/[a-z]*'|grep -o '[a-z]*')
    if [ "$estado" == "ESTABLISHED" ]; then
        total+="🚦️ "$puertos$separador$servicio" | "
    else
        total+="🚥️ "$puertos$separador$servicio" | "
    fi
done < $listapuertos
if [ -n "$total" ]; then
    echo "$total"
else
    echo " 🚧️  No Open Ports   "
fi
