FROM nginx:alpin
CMD docker run -d -p 80:80 html-server-image:v1
WORKDIR /app
COPY . /app
RUN mv .env.example .env
COPY . /usr/share/nginx/html
RUN html install
#RUN composer install --ignore-platform-req=ext-dom --ignore-platform-req=ext-fileinfo --ignore-platform-req=ext-sodium --ignore-platform-req=ext-fileinfo --ignore-platform-req=ext-fileinfo --ignore-platform-req=ext-tokenizer --ignore-platform-req=ext-dom --ignore-platform-req=ext-tokenizer --ignore-platform-req=ext-imagick --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-tokenizer --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-fileinfo --ignore-platform-req=ext-gd --ignore-platform-req=ext-xmlwriter --ignore-platform-req=ext-xmlwriter --ignore-platform-req=ext-xml --ignore-platform-req=ext-xmlwriter --ignore-platform-req=ext-simplexml --ignore-platform-req=ext-xmlreader
#ENTRYPOINT ["/usr/bin/php","artisan serve"]
RUN docker run -d -p 80:80 html-server-image:v1
EXPOSE 8000
RUN curl localhost:80
CMD html-server --host 0.0.0.0 --port 8000
