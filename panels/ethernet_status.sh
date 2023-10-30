  GNU nano 6.2                                                                                 ethernet_status.sh                                                                                           
#!/bin/bash

echo   "$(/usr/sbin/ifconfig eth0 | grep 'inet ' | awk '{print $2}')    "
