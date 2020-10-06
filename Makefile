.PHONY: init
init:
	docker-compose build

.PHONY: run
run:
	docker-compose up
