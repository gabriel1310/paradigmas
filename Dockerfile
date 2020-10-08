FROM ubuntu:latest
#download da imagem

#roda durante o container para instalar as dependencias
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install -y build-essential apt-utils php7.4-dev php7.4 php7.4-cgi php7.4-cli \\
php7.4-common php-bcmath php-fpm php7.4-xml phpdox php7.4-mbstring php7.4-json composer php7.4-zip php7.4-pgsql php7.4-mbstring unzip 

WORKDIR /home/app
RUN composer global require laravel/installer && composer -vvv create-project --prefer-dist laravel/laravel blog
#executa dentro do container 
RUN apt-get -y install nano vim

WORKDIR /home/app/blog




ENTRYPOINT [ "php","artisan","serve","--host","0.0.0.0" ] 
#fará a inicialização do container
