all: build

build:
	@docker-compose --file=docker-compose.yml up --build

fclean:
	rm -rf srcs/shared/build/contracts/TournamentScores.json
	rm -rf srcs/services/django/media/images/*
	@docker stop $(shell docker ps -qa)
	@docker rm $(shell docker ps -qa)
	@docker image rm -f $(shell docker images -qa)
	@docker volume rm $(shell docker volume ls -q)
	@docker network rm $(shell docker network ls --filter "type=custom" --format "{{.Name}}")

prune:
	@docker system prune

re: fclean build

.PHONY: all build fclean re prune
