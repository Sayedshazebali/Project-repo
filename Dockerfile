<<<<<<< HEAD
FROM nginx:alpine
COPY . /usr/share/nginx/html
=======
FROM nginx
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY content /usr/share/nginx/html
COPY conf /etc/nginx
VOLUME /var/log/nginx/log
>>>>>>> 6f54a51f8067276b4c63e7c5629592321f130cdd
