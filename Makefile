include .env

.PHONY: prod-debug

prod-debug:
	chmod +x ./wait-for-it.sh && sudo docker-compose up --build

.PHONY: prod
prod:
	chmod +x ./wait-for-it.sh && sudo docker-compose up -d --build

.PHONY: down

down:
	sudo docker-compose down -v
