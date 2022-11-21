PATH_DC_FILE	=	./srcs/docker-compose.yml

DOCKER_COMPOSE	=	docker compose -f $(PATH_DC_FILE)

MARIADB_DIR		=	/home/mkhabou/data/mariadb

WORDPRESS_DIR	=	/home/mkhabou/data/wordpress


all		:	up


up		:	dirs
				$(DOCKER_COMPOSE) up -d

down	:
				$(DOCKER_COMPOSE) down

ps		:
				$(DOCKER_COMPOSE) ps

logs	:
				$(DOCKER_COMPOSE) logs -f

clean	:
				$(DOCKER_COMPOSE) down --volumes --rmi all; 

dirs	:
				mkdir -p $(WORDPRESS_DIR) && mkdir -p $(MARIADB_DIR)



.PHONY	:	all up start down ps logs

