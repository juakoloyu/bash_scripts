#!/bin/bash
#Script para enviar el espacio en disco del servidor
#Desarrollado por Joaquin Logiudice
#Recibe como argumento $1 = Host a donde enviar el_post

tamanio=$(df -h / | awk 'NR==2{ print $2}')
usado=$(df -h / | awk 'NR==2{ print $3}')
disponible=$(df -h / | awk 'NR==2{ print $4}')
host=$1
ip=$(hostname -I | awk '{print $1}')
nombre_servidor=$(hostname)
detalle="Estado del espacio en disco"
fecha=$(date '+%Y-%m-%d %H:%M')
echo $ip
$(curl --location --request POST "$host/servidores/Servidores/postServidores" \
--form "tamanio=$tamanio" \
--form "estado=$estado" \
--form "usado=$usado" \
--form "ip=$ip" \
--form "disponible=$disponible" \
--form "nombre_servidor=$nombre_servidor" \
--form "fecha_servidor=$fecha" \
--form "detalle=$detalle")
