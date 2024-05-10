#!/bin/sh

set -e
set -x

exec > ${_CONTAINER_USER_HOME}/aztec-sandbox-install.log 2>&1

echo "Installing Aztec Sandbox for $_REMOTE_USER..."

curl -s install.aztec.network | \
    # sed hack to remove enforcement of docker running
    sed '/Docker is not running/,+1 s/exit 1//' | \
    # install aztec sandbox as the remote user
    su $_REMOTE_USER -c "env NON_INTERACTIVE=1 SKIP_PULL=1 bash"

if [ "$AUTORUN" = "true" ] ; then
  # this is checked with the postStartCommand to determine if the sandbox container
  touch ${_REMOTE_USER_HOME}/.aztec-sandbox-autorun
fi

echo "Finished Aztec Sandbox install"
