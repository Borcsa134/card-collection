.PHONY: start stop build sh tsh logs test restart config commit lint psql migrate rollback tpsql tmigrate trollback demo-data promote

container=cc

# start all the containers
start:
	docker compose up -d

# stop all the containers
stop:
	docker compose down

# restart containers
restart: stop start

# build the app container
build:
	docker compose build

# get a shell within the app container
sh:
	docker compose exec $(container) /bin/sh

# check console output
logs:
	docker compose logs -f

# show the combined compose file used
config:
	docker compose config