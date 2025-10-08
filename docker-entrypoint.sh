#!/usr/bin/env bash
set -e

echo "[custom] preparing key…"
mkdir -p /root/.ssh
chmod 700 /root/.ssh

if [ -n "$SSH_KEY" ]; then
  echo "[custom] saving key to /root/.ssh/id_rsa"
  echo "$SSH_KEY" > /root/.ssh/id_rsa
  chmod 600 /root/.ssh/id_rsa
fi

echo "[custom] launching original autossh entrypoint..."
exec /entrypoint.sh "$@"
