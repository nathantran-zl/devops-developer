#!/bin/bash

# Build image for user-service-buider.
docker build -f back-end/user-service/Dockerfile --target builder -t nathantran/user-service-builder:latest .

# Run user-service with dev environment.
docker-compose -f back-end/user-service/docker-compose.dev.yml up