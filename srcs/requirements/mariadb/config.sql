CREATE DATABASE wordpress;
CREATE USER 'mk'@'wordpress.srcs_inception' IDENTIFIED BY 'mdp';
GRANT ALL PRIVILEGES ON wordpress.* TO mk@wordpress.srcs_inception;
FLUSH PRIVILEGES;
