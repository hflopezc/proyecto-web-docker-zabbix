#!/bin/bash

echo "======================================"
echo "   DESPLIEGUE MOTOS EL CÓNDOR"
echo "======================================"

echo "Deteniendo contenedor anterior..."
sudo docker stop nginx-web 2>/dev/null || true

echo "Eliminando contenedor anterior..."
sudo docker rm nginx-web 2>/dev/null || true

echo "Creando contenedor Nginx..."
sudo docker run -d \
  --name nginx-web \
  -p 80:80 \
  -v ~/proyecto-web:/usr/share/nginx/html:ro \
  nginx

echo "======================================"
echo "Despliegue finalizado correctamente"
echo "======================================"

echo "Contenedor activo:"
sudo docker ps --filter "name=nginx-web"
