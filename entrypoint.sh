#!/bin/sh

envsubst < /usr/share/nginx/html/manifest.xml.template > /usr/share/nginx/html/manifest.xml
envsubst < /usr/share/nginx/html/config.js.template > /usr/share/nginx/html/config.js

nginx -g "daemon off;"
