#!/bin/bash

function ctrl_c(){
        echo "\n[!]Saliendo..."
        exit 1
}

trap ctrl_c INT

#Comprobación del número de argumentos
if [[ $# -ne 1 ]]; then
    echo "Uso: $0 <IP>"
    exit 1
fi

#Asignación de argumento a variable
ip="$1"

for port in $(seq 1 65535); do
        timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo "Puerto $port Abierto" &
done; wait

echo "\n Fin del escaneo\n"
exit 0
