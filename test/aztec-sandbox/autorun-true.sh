#!/bin/bash

set -e

source dev-container-features-test-lib

check "anvil container is running" bash -c "docker compose -p sandbox ps --filter status=running --services ethereum | grep ."
check "aztec container is running" bash -c "docker compose -p sandbox ps --filter status=running --services aztec | grep ."

# Report result
reportResults
