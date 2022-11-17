PATH_DC_FILE	=	./srcs/docker-compose.yml

DOCKER_COMPOSE	=	docker compose -f $(PATH_DC_FILE)

MARIADB_DIR		=	/home/mkhabou/data/mariadb

WORPRESS_DIR	=	/home/mkhabou/data/wordpress

$(DIRS_CREATED)	:
					mkdir -p /home/mkhabou/data/mariadb


all		:$(DIRS_CREATED)
			$(DOCKER_COMPOSE) up -d

ps		:
			$(DOCKER_COMPOSE) ps

logs	:
			$(DOCKER_COMPOSE) logs

#down	:
#			$(DOCKER_COMPOSE) down

#restart	:
#			$(DOCKER_COMPOSE) restart

#start	:
#			$(DOCKER_COMPOSE) start

#stop	:
#			$(DOCKER_COMPOSE) stop

#clean	:
#
#fclean	:
#
#re		:

.PHONY	:	all ps logs #clean fclean re

