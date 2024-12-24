


run container with ports mapped

podman run -it -p 8080:8080 -v ./src:/var/www/html ian/php-nginx



podman run --name qwatt-db  -p 3306:3306 --net podman -v /home/ubuntu/work/ian-php-nginx/mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=rootpw -d mysql:8.4.3 --mysql-native-password=ON