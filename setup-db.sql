create database ppa;
CREATE USER 'app'@'%' IDENTIFIED BY 'app-pwd';
GRANT ALL ON ppa.* TO 'app'@'%';
FLUSH PRIVILEGES;