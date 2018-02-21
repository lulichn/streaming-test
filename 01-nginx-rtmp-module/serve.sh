#!/bin/sh

docker run \
	-p 8080:80 \
	-p 1935:1935 \
	-v "$PWD/nginx.conf:/etc/nginx/nginx.conf" \
	-v "$PWD/index.html:/usr/share/nginx/html/index.html" \
	-v "$PWD/hls:/usr/share/nginx/html/hls" \
	nginx-rtmp

