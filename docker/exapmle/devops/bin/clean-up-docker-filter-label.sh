#!/usr/bin/env bash

# A label maintainer variable.
labelMaintainer="label=maintainer=nathan.tran0222@asnet.com.vn"

# Remove containers filter with label maintainer.
docker container prune -f --filter $labelMaintainer

# Remove images filter with label maintainer.
docker image prune -fa --filter $labelMaintainer

# Remove volumes filter with label maintainer.
docker volume prune -f --filter $labelMaintainer

# Remove networks filter with label maintainer.
docker network prune -f --filter $labelMaintainer
