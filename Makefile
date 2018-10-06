help:													## Show this help.
	@echo ''
	@echo 'Available commands:'
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ''
.PHONY: help

gen-readme:										## Generate README.md (using docker-verb).
	docker run --rm -v ${PWD}:/opt/verb stefanwalther/verb
.PHONY: gen-readme

up:
	docker-compose -f docker-compose.yml up -d
.PHONY: up

up-deps-i:										## Start required servise for development (interactive mode).
	docker-compose -f docker-compose.deps.yml up
.PHONY: up-deps-i

up-deps:											## Start required services for development.
	docker-compose -f docker-compose.deps.yml up -d
.PHONY: up-deps

down:
	docker-compose -f -docker-compose.yml down
.PHONY: down

down-deps:										## Tear down services required for development.
	docker-compose -f docker-compose.deps.yml down -t 0
.PHONY: down-deps

clean-deps: down-deps					## Tear down dependent service + clean-up artifacts.
	rm -rf ./.datastore
.PHONY: clean-deps

del-nats-store:
	rm -rf ./.datastore
.PHONY: del-nats-store

build:												## Build the docker image.
	docker build -t sammlerio/scheduler .
.PHONY: build

build-no-cache:								## Build the docker image (no-cache).
	docker build --no-cache -t sammlerio/scheduler .
.PHONY: build

start:
	npm run start
.PHONY: start
