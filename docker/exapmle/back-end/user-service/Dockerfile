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

################################################################################
# Base image is alpine Linux with openjdk 12 for stage prod.
FROM openjdk:12-jdk-alpine AS prod

# Labels schema.
LABEL maintainer="nathan.tran0222@gmail.com" \
  version="1.0" \
  description="Dockerfile for prod"

# Default working directory set to /src.
WORKDIR /src

# Copy user-service-0.0.1-SNAPSHOT.jar.jar to /src/app.jar
COPY --from=builder /target/user-service-0.0.1-SNAPSHOT.jar app.jar

# Run application
ENTRYPOINT [ "java", "jar", "app.jar" ]

# Health check with Spring Actuator.
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f localhost:8080/health || exit 1

################################################################################
# Base image is builder for stage unit-test.
FROM builder AS unit-test

################################################################################
# Base image is prod for stage integration-test.
FROM prod AS integration-test
