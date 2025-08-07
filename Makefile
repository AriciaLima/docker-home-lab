# ========= Docker Home Lab - Makefile =========
# Automate common Docker tasks and service checks

# -------------
# 🐳 Docker Compose Commands
# -------------

# Start all containers in background
up:
	docker compose up -d

# Stop and remove all containers
down:
	docker compose down

# Restart all containers
restart:
	docker compose restart

# View container logs (follow mode)
logs:
	docker compose logs -f

# Show running containers and their status
ps:
	docker compose ps

# Pull latest images and restart containers
update:
	docker compose pull
	docker compose up -d

# Clean up all unused Docker data (including volumes)
prune:
	docker system prune -af --volumes

# -------------
# ⚙️ System Setup
# -------------

# Run setup script to install Docker and dependencies
setup:
	bash scripts/setup.sh

# -------------
# 🧪 Health Check Scripts
# -------------

# Run Node.js service checker
test:
	node tests/test-home-lab.js

# Run Bash service checker
test-bash:
	bash tests/test-home-lab.sh
