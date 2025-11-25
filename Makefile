.SILENT:
.PHONY: initialize dev down down-volumes restart logs build \
  prod-api prod-client down-prod logs-prod open \
  open-prod shell-db shell-redis status

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

# Test
e2e:
	COMPOSE_BAKE=true docker compose -f docker-compose.test.yaml up --build

down-e2e:
	docker compose -f docker-compose.test.yaml down

restart-e2e:
	$(MAKE) down-volumes
	$(MAKE) e2e

logs-e2e:
	docker compose -f docker-compose.test.yaml logs -f --tail=50

# Production
prod-api:
	COMPOSE_BAKE=true docker compose -f docker-compose.prod.yaml up bff --build -d

prod-client:
	COMPOSE_BAKE=true docker compose -f docker-compose.prod.yaml up frontend --build -d

down-prod:
	docker compose -f docker-compose.prod.yaml down

logs-prod:
	docker compose -f docker-compose.prod.yaml logs -f --tail=50

# App
open:
	open http://localhost

open-prod:
	open https://fc1g-lab.dev

# Database / UI
shell-db:
	docker exec -it database psql -U $$POSTGRES_USER -d $$POSTGRES_DB

shell-redis:
	docker exec -it redis redis-cli

# Status
status:
	docker compose ps