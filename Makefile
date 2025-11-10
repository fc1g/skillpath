.SILENT:
.PHONY: initialize dev down down-volumes restart logs build \
  prod down-prod restart-prod logs-prod \
  open shell-db shell-redis pgadmin redisinsight status

initialize:
	cd skillpath-frontend && pnpm i
	cd skillpath-backend && pnpm i

# Development
dev:
	COMPOSE_BAKE=true docker compose up --build

down:
	docker compose down && clear

down-volumes:
	docker compose down -v && clear

restart:
	$(MAKE) down
	$(MAKE) dev

logs:
	docker compose logs -f --tail=50

build:
	COMPOSE_BAKE=true docker compose build

# Production
prod:
	COMPOSE_BAKE=true docker compose -f docker-compose.prod.yaml up --build -d

down-prod:
	docker compose -f docker-compose.prod.yaml down

restart-prod:
	$(MAKE) down-prod
	$(MAKE) prod

logs-prod:
	docker compose -f docker-compose.prod.yaml logs -f --tail=50

# App
open:
	open http://localhost

# Database / UI
shell-db:
	docker exec -it database psql -U $$POSTGRES_USER -d $$POSTGRES_DB

shell-redis:
	docker exec -it redis redis-cli

pgadmin:
	open http://localhost:5050

redisinsight:
	open http://localhost:5540

# Status
status:
	docker compose ps