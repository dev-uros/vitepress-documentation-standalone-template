include ./.env.docker

up-dev:
	docker compose -f $(DOCKER_COMPOSE_DEV_FILE) up --build

up-prod:
	docker compose -f $(DOCKER_COMPOSE_PROD_FILE) up -d --build

down-dev:
	docker compose -f $(DOCKER_COMPOSE_DEV_FILE) down
	docker container prune
	docker image prune -a

down-prod:
	docker compose -f $(DOCKER_COMPOSE_PROD_FILE) down
	docker container prune
	docker image prune -a

vpress:
	docker exec -it $(DOCUMENTATION_CONTAINER) sh
