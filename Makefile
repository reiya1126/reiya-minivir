.PHONY: up

up:
		docker-compose up -d

.PHONY: apply

apply:
		atlas schema apply \
  -u "postgresql://postgres:pass@localhost:5432/example?sslmode=disable" \
  --to file://schema.sql \
  --dev-url "docker://postgres/14/example"

