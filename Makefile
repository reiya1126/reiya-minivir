.PHONY: middleware.up

middleware.up:
	docker-compose up -d

.PHONY: middleware.down

middleware.down:
	docker-compose down