#!/bin/bash
netstat -tulnp | grep "LISTEN" | awk '{print $4, $7}' | awk -F'/' '{print $1, $2}' | awk -F ' ' '{print $1,$3}' | sed 's/0.0.0.0://;s/::://' > /home/kali/.config/panels/puertos-abiertos.txt

listapuertos="/home/kali/.config/panels/puertos-abiertos.txt"
separador=" : "
while read -r lineaquelee
do
    linea=$lineaquelee
    puertos=$(echo $linea | awk -F ' ' '{print $1}')
    servicio=$(echo $linea | awk '{print $2}')
    total+="🚦️ "$puertos$separador$servicio" | "
done < $listapuertos
if [ -n "$total" ]; then
    echo "$total"
else
    echo " 🚧️  No Open Ports   "
fi
