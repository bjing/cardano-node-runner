#!/bin/bash

### THIS IS NOT WORKING YET!

CARDANO_NODE_VERSION="8.1.2"
source ~/.bash_cardano

RUNNING_INSTANCE=$(docker ps | grep cardano-node-mainnet | wc -l)

if [ $RUNNING_INSTANCE = "1" ]; then
  echo "Instance is already running. Bailing"
  exit 1
fi

# Delete stopped cardano-node docker instance if any
echo "Removing any stopped instance..."
docker ps -a | grep cardano-node-mainnet | awk '{print $1}' | xargs docker rm

if [ $? -eq 0 ] || [ $? -eq 123 ]; then
  docker run \
    -v "$CARDANO_NODE_MAINNET/configuration":/configuration \
    -v "$CARDANO_NODE_MAINNET/runtime/ipc":/ipc \
    -v "$CARDANO_NODE_MAINNET/runtime/db":/data/db \
    -e NETWORK=mainnet \
    --name cardano-node-mainnet \
    "inputoutput/cardano-node:$CARDANO_NODE_VERSION" run  \
      --config /configuration/config.json \
      --topology /configuration/topology.json \
      --database-path /data/db \
      --host-addr 0.0.0.0 \
      --port 3001 \
      --socket-path /ipc/node.socket
else
  echo "Something is wrong. Please check existing running docker instance"
fi 
