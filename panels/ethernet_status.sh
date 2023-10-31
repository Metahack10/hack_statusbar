#!/bin/bash

ip0=$(/usr/sbin/ifconfig eth0 | grep 'inet ' | awk '{print $2}'|tr -d '\n')
ip1=$(/usr/sbin/ifconfig eth1 | grep 'inet ' | awk '{print $2}'|tr -d '\n')
if [ -z "$ip0" ]; then
    if [ -z "$ip1" ]; then
    redes="  ⚡️  Disconnected"
    else
    redes="🖥  $ip1"
    fi
else
    red="🖥  "$ip0
    if [ -n "$ip1" ]; then
    redes=$red" | 🖥 "$ip1
    else
    redes=$red
    fi
fi

echo "$redes"
