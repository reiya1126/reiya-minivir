.PHONY: middleware.up
middleware.up:
	docker-compose up -d

.PHONY: middleware.down
middleware.down:
	docker-compose down

.PHONY: middleware.reset
middleware.reset:
	docker-compose down -v

.PHONY: middleware.psql
middleware.psql:
	PGPASSWORD=minivr psql -h localhost -p 5432 -U minivr -d minivr

.PHONY: migrate apply
apply:
	atlas schema apply \
		-u "postgresql://minivr:minivr@localhost:5432/minivr?sslmode=disable" \
		--to file://schema.sql \
		--dev-url "docker://postgres/15/dev"

.PHONY: migrate.plan
migrate.plan:
	atlas schema diff \
		--from "postgresql://minivr:minivr@localhost:5432/minivr?sslmode=disable" \
		--to "file://schema.sql" \
		--dev-url "docker://postgres/15/dev"