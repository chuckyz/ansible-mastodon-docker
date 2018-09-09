#!/bin/bash
docker run -v /etc/letsencrypt:/etc/letsencrypt -p 80:80 --rm certbot/certbot renew
docker exec -it proxy_nginx_1 /usr/sbin/nginx -s reload