################################################################################
# Dockerfile to build a Java Spring Boot application with Maven.               #
################################################################################
# escape=`

################################################################################
# Base image is alpine Linux with maven 3.6 - jdk 12 for stage builder.
FROM maven:3.6-jdk-12-alpine AS builder

# Labels schema.
LABEL maintainer="nathan.tran0222@gmail.com" \
  version="1.0" \
  description="Dockerfile for builder"

# Default working directory set to /app.
WORKDIR /app

# Health check with Spring Actuator.
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f localhost:8080/health || exit 1
