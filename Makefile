# Makefile

# Variables
PHP_SERVICE = php

# Default action: start the project
default: start

# Start the project
start: check_composer_json
	docker-compose up -d

# Stop the project
stop:
	docker-compose down

# Restart the project
restart:
	docker-compose down && docker-compose up -d

# Show logs
logs:
	docker-compose logs -f

# Install dependencies
install: check_composer_json
	docker-compose run --rm $(PHP_SERVICE) composer install

# Run migrations
migrate:
	docker-compose run --rm $(PHP_SERVICE) php bin/console doctrine:migrations:migrate

# Initialize Symfony project if composer.json is missing
check_composer_json:
	@if [ ! -f composer.json ]; then \
		echo "No composer.json found, initializing Symfony project outside Docker..."; \
		composer create-project symfony/skeleton temp_symfony_project; \
		mv temp_symfony_project/* temp_symfony_project/.* . 2>/dev/null || true; \
		rmdir temp_symfony_project; \
	fi
console:
	docker-compose exec $(PHP_SERVICE) sh