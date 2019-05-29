#!/bin/bash

# Build image for user-service-prod.
docker build -f back-end/user-service/Dockerfile --target prod -t nathantran/user-service-prod:latest .

# Run user-service with prod environment.
docker-compose -f back-end/user-service/docker-compose.prod.yml up