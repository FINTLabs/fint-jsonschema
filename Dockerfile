FROM fintlabs.azurecr.io/nginx:1.15.10-1
COPY schema/ /etc/nginx/html/
