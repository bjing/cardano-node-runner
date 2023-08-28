#!/bin/sh

ENVS="preview preprod mainnet"
MODES="local docker"
for ENV in $ENVS; do
  for MODE in $MODES; do 
    IPC_DIR="envs/$ENV/runtime/$MODE/ipc"
    echo "Creating dir: $IPC_DIR"
    mkdir -p envs/$ENV/runtime/$MODE/ipc

    DB_DIR="envs/$ENV/runtime/$MODE/db"
    echo "Creating dir: $DB_DIR"
    mkdir -p envs/$ENV/runtime/$MODE/db
  done;
done;
