include .env

.PHONY: prod

prod:
	chmod +x ./wait-for-it.sh && sudo docker-compose up --build

.PHONY: down

down:
	sudo docker-compose down -v
