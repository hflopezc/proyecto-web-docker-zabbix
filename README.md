# Proyecto Integrador
## Despliegue y monitoreo de un servidor web en AWS EC2 mediante Docker

### Descripción

Este proyecto implementa un servidor web utilizando **Nginx dentro de un contenedor Docker**, desplegado sobre una instancia **AWS EC2 con Ubuntu Server**.

El sitio web desarrollado corresponde a **Motos El Cóndor**, una página demostrativa para un negocio de repuestos y accesorios para motocicletas.

El proyecto también incorpora **Zabbix** para el monitoreo de la infraestructura y del servicio web.

### Tecnologías utilizadas

- AWS EC2
- Ubuntu Server 24.04 LTS
- Docker
- Nginx
- Bash
- Zabbix
- Git y GitHub
- HTML y CSS

### Arquitectura

```text
                    INTERNET
                       |
                       | HTTP :80
                       v
              +-------------------+
              |    AWS EC2        |
              | Ubuntu Server     |
              +---------+---------+
                        |
                     Docker
                        |
                +-------v-------+
                |     Nginx     |
                |  Contenedor   |
                +-------+-------+
                        |
                        v
                  Motos El Cóndor
                    index.html


              MONITOREO
                  |
                  v
          +-------------------+
          |   Zabbix Server   |
          |     AWS EC2       |
          +---------+---------+
                    |
                    | Zabbix Agent 2
                    | TCP 10050
                    v
          +-------------------+
          | Servidor Web EC2  |
          | motos-el-condor   |
          +-------------------+

### Servidor web

El servidor web utiliza Nginx ejecutándose dentro de Docker.

Directorio del proyecto:

~/proyecto-web

Contenedor:

nginx-web

Puerto publicado:

80:80

### Automatización

El archivo deploy.sh automatiza el despliegue del contenedor Nginx.

El script:

1. Detiene el contenedor anterior.
2. Elimina el contenedor anterior.
3. Crea nuevamente el contenedor Nginx.
4. Monta el directorio del proyecto.
5. Publica el puerto 80.
6. Muestra el estado del contenedor.

### Monitoreo con Zabbix

Se configuró Zabbix para monitorear el servidor web.

Se implementó:

- Monitoreo de CPU.
- Monitoreo de memoria RAM.
- Monitoreo de espacio en disco.
- Monitoreo mediante Zabbix Agent 2.
- Monitoreo del servicio web mediante Web Scenario.

El escenario web verifica:

URL: http://54.82.30.229

Código HTTP esperado: 200

Texto esperado: MOTOS EL CÓNDOR

### Zabbix Agent 2

Hostname: motos-el-condor-web

Servidor Zabbix: 172.31.78.114

ServerActive: 172.31.78.114

Puerto del agente: 10050

### GitHub

El código fuente del proyecto se encuentra en:

https://github.com/hflopezc/proyecto-web-docker-zabbix

### Archivos principales

proyecto-web/
├── index.html
├── deploy.sh
└── README.md

### Objetivo

El objetivo del proyecto es demostrar la implementación de un servicio web en un entorno virtualizado utilizando AWS EC2 y Docker, incorporando automatización mediante Bash y monitoreo mediante Zabbix.

### Autor

Hector Lopez
