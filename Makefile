# Variables
DOCKER_IMAGE_NAME=tom-core

# Build Commands
build-prod:
	docker build --target production -t $(DOCKER_IMAGE_NAME):prod .

build-dev:
	docker build --target development -t $(DOCKER_IMAGE_NAME):dev .

# Run Commands
run-prod:
	docker run -p 2000:2000 $(DOCKER_IMAGE_NAME):prod

run-dev:
	docker run -p 3000:3000 $(DOCKER_IMAGE_NAME):dev

# Clean Commands
clean:
	docker system prune -f
