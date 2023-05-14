up:
	mkdir -p ./.docker/mysql
	docker network create symfony-networks || docker-compose \
		-f docker-compose.yml \
		--env-file=.env.local \
		up -d --build --remove-orphans

prod:
	mkdir -p ./.docker/mysql
	docker network create symfony-networks || docker-compose \
        -f ./docker-compose.yml
	--env-file=./.env.prod \
	up -d --build --remove-orphans

preprod:
	mkdir -p ./.docker/mysql
	docker network create symfony-networks || docker-compose \
        -f ./docker-compose.yml
	--env-file=./.env.prod \
	up -d --build --remove-orphans

ssh:
	docker exec -it symfony6-php-fpm bash

stop:
	docker stop symfony6-nginx
	docker stop symfony6-php-fpm
	docker stop symfony6-mysql
	docker stop symfony6-redis
	docker stop symfony6-phpmyadmin
	docker stop symfony6-postgres

rm:
	docker rm symfony6-nginx
	docker rm symfony6-php-fpm
	docker rm symfony6-mysql
	docker rm symfony6-redis
	docker rm symfony6-phpmyadmin
	docker rm symfony6-postgres