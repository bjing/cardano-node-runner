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

docker run --rm \
  --name ogmios \
  -p 1337:1337 \
  -v "$CARDANO_NODE_PATH/runtime/local/ipc":/ipc \
  cardanosolutions/ogmios:latest \
    --node-socket /ipc/node.socket \
    --node-config /config/cardano-node/config.json \
    --host 0.0.0.0
