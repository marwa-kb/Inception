PATH_DC_FILE	=	./srcs/docker-compose.yml

DOCKER_COMPOSE	=	docker compose -f $(PATH_DC_FILE)

MARIADB_DIR		=	/home/mkhabou/data/mariadb

WORPRESS_DIR	=	/home/mkhabou/data/wordpress


$(DIRS_CREATED)	:
					mkdir -p $(MARIADB_DIR)
					mkdir -p $(WORDPRESS_DIR)


all		:	up

build	:	$(DIRS_CREATED)
				$(DOCKER_COMPOSE) up --build -d

up		:	$(DIRS_CREATED)
				$(DOCKER_COMPOSE) up -d

down	:
				$(DOCKER_COMPOSE) down

ps		:
				$(DOCKER_COMPOSE) ps

logs	:
				$(DOCKER_COMPOSE) logs

clean	:
				$(DOCKER_COMPOSE) down -v --rmi all

#fclean	:clean
#			rm -rf $(MARIADB_DIR)/*
#			rm -rf $(WORDPRESS_DIR)/*
#re		:
#			$(DOCKER_COMPOSE) up -d --force-recreate

.PHONY	:	all up start restart stop down ps logs clean fclean re

