RESET				=	\e[0;0m
GREEN				=	\e[0;32m
YELLOW				=	\e[0;33m
BLUE				=	\e[0;34m
PURPLE				=	\e[0;35m

LOGIN				=	brunrodr
HOSTNAME			=	127.0.0.1       $(LOGIN).42.fr
BACKUP_DIR			=	/home/$(LOGIN)/backup
VOLUME_DIR			=	/home/$(LOGIN)/data
DOCKER_COMPOSE_FILE	=	./srcs/docker-compose.yml

all: config run

config:
	sudo mkdir -p $(BACKUP_DIR)
	sudo sed -i "/$(HOSTNAME)/d" /etc/hosts 
	sudo cp /etc/hosts $(BACKUP_DIR)/hosts-bkp
	sudo sed -i "1i $(HOSTNAME)" /etc/hosts

run:
	@echo "$(GREEN)Creating foldes to storage volumes from wordpress and mariadb$(RESET)"
	sudo mkdir -p $(VOLUME_DIR)/wordpress
	sudo mkdir -p $(VOLUME_DIR)/mariadb
	@echo "$(GREEN)Building containers via docker-compose$(RESET)"
	docker-compose -f $(DOCKER_COMPOSE_FILE) build
	@echo "$(GREEN)Running containers...$(RESET)"
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

build:
	@echo "$(BLUE)Stopping containers via docker-compose$(RESET)"
	docker-compose -f $(DOCKER_COMPOSE_FILE) down
	@echo "$(BLUE)Building specific container $(CONTAINER) passed as argument...$(RESET)"
	docker-compose -f $(DOCKER_COMPOSE_FILE) build $(CONTAINER)
	@echo "$(BLUE)Running containers...$(RESET)"
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

down:
	@echo "$(BLUE)Stopping containers via docker-compose$(RESET)"
	docker-compose -f $(DOCKER_COMPOSE_FILE) down

up:
	@echo "$(BLUE)Running containers...$(RESET)"
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

	

################### DEBUG ################### 

logs:
	@echo "$(PURPLE)Accessing logs from container: $(YELLOW)$(CONTAINER) $(RESET)"
	docker logs $(CONTAINER)

#e.g make exec CONTAINER=<container_name>
exec:
	@echo "$(PURPLE)Accessing container: $(YELLOW)$(CONTAINER) $(RESET)"
	docker exec -it $(CONTAINER) bash 

fclean:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down
	bash clean_docker.sh
	sudo cp /home/brunrodr/backup/hosts-bkp /etc/hosts
	@echo "$(BLUE)Docker files deleted and hostname restored to localhost$(RESET)"
	sudo rm -rf /home/brunrodr/data/wordpress/*
	sudo rm -rf /home/brunrodr/data/mariadb/*
	@echo "$(BLUE)Docker files deleted and hostname restored to localhost$(RESET)"