#!/bin/bash
filename='/home/kali/.config/panels/target'

machine_name=$1
ip=$(sed -n "/$machine_name/p" "$filename" | awk '{print $1}' | tr -d '\n')
if [ -z "$ip" ]; then
    echo "No Target" |tr -d '\n' | xclip -selection clipboard
else
    echo -n $ip |xclip -selection clipboard
fi
