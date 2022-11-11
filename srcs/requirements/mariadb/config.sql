CREATE DATABASE wordpress;
CREATE USER 'mk'@'localhost' IDENTIFIED BY 'mdp';
GRANT ALL PRIVILEGES ON wordpress.* TO mk@localhost;
FLUSH PRIVILEGES;
exit
