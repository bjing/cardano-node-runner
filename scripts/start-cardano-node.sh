#!/bin/bash

source ~/.bash_cardano

NETWORK=$1
if [ "$NETWORK" = "preview" ]; then
  CARDANO_NODE_PATH=$CARDANO_NODE_PREVIEW
elif [ "$NETWORK" = "preprod" ]; then
  CARDANO_NODE_PATH=$CARDANO_NODE_PREPROD
elif [ "$NETWORK" = "mainnet" ]; then
  CARDANO_NODE_PATH=$CARDANO_NODE_MAINNET
else
  echo "Unrecognised network, please specify one of preview|reprod|mainnet"
  exit 1
fi

cardano-node run \
  --config $CARDANO_NODE_PATH/configuration/config.json \
  --database-path $CARDANO_NODE_PATH/runtime/local/db \
  --socket-path $CARDANO_NODE_PATH/runtime/local/ipc/node.socket \
  --host-addr 0.0.0.0 \
  --port 3001 \
  --topology $CARDANO_NODE_PATH/configuration/topology.json
