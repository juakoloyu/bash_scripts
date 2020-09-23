#!/bin/bash
#Script para enviar el espacio en disco del servidor
#Desarrollado por Joaquin Logiudice
# $1 = Host_to_post

tamanio=$(df -h / | awk 'NR==2{ print $2}')
usado=$(df -h / | awk 'NR==2{ print $3}')
disponible=$(df -h / | awk 'NR==2{ print $4}')
porcentaje_uso=$(df -h / | awk 'NR==2{ print $5}')
host=$1
echo $host
nombre_servidor=$(hostname)
detalle="Estado del espacio en disco"
fecha=$(date '+%Y-%m-%d %H:%M')

$(curl --location --request POST "$host/servidores/Servidores/postServidores" \
--form "tamanio=$tamanio" \
--form "estado=$estado" \
--form "usado=$usado" \
--form "disponible=$disponible" \
--form "nombre_servidor=$nombre_servidor" \
--form "fecha_servidor=$fecha" \
--form "detalle=$detalle")
