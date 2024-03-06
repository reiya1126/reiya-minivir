.PHONY: middleware.up
middleware.up:
	docker-compose up -d

.PHONY: middleware.down
middleware.down:
	docker-compose down

.PHONY: middleware.psql
middleware.psql:
	PGPASSWORD=minivr psql -h localhost -p 5432 -U minivr -d minivr

.PHONY: apply
apply:
	atlas schema apply \
		-u "postgresql://minivr:minivr@localhost:5432/minivr?sslmode=disable" \
		--to file://schema.sql \
		--dev-url "docker://postgres/14/minivr"