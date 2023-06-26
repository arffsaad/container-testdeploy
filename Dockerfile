FROM webdevops/php-nginx:8.2-alpine

COPY ./index.php /app/index.php

EXPOSE 80
