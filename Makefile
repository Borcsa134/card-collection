.PHONY: start stop build sh tsh logs test restart config commit lint psql migrate rollback tpsql tmigrate trollback

# \
!ifndef 0 # \
wait_for_input=pause # \
!else
wait_for_input=read
# \
!endif



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

# console to the DB
psql:
	docker compose exec postgres psql -U app_dev dev

# check console output
logs:
	docker compose logs -f

# show the combined compose file used
config:
	docker compose config

migrate:
	docker compose exec $(container) /bin/sh -c "npx prisma migrate dev"

promote:
	echo "Make sure master/production branch is up-to-date! And what you are about to deploy is already on staging! Hit [ENTER] to continue"
	$(wait_for_input)
	git checkout production
	git rebase main
	git push
	git checkout main
