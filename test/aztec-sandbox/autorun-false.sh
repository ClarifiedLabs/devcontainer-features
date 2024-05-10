#!/bin/bash

set -e

source dev-container-features-test-lib

check "aztec sandbox services are NOT running" bash -c 'test -z "$(docker compose -p sandbox ps --filter status=running --services)"'

# Report result
reportResults
