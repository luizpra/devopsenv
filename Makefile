
GITHUB_USER=luizpra


build:
	docker-compose build --no-cache

up:
	docker-compose up -d --build

ps:
	docker-compose ps	

down: 
	docker-compose down

bash:
	docker-compose exec -it dev bash

login:
	echo ${CR_PAT} | docker login ghcr.io -u ${GITHUB_USER} --password-stdin

push:
	docker build . --tag ghcr.io/${GITHUB_USER}/dev:latest
	docker push ghcr.io/${GITHUB_USER}/dev:latest

