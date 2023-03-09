#!/bin/bash

function ctrl_c(){
        echo "\n[!]Saliendo..."
        exit 1
}

trap ctrl_c INT

#Variables_Globales
ip="10.197.243.77"

for port in $(seq 1 65535); do
        timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo "Puerto $port Abierto" &
done; wait

echo "\n Fin del escaneo\n"
exit 0
