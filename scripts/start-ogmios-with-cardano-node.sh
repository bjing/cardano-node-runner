#!/bin/bash

source $HOME/.bash_cardano 

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

docker run -it \
  --name cardano-node-ogmios \
  -p 1337:1337 \
  -v "$CARDANO_NODE_PATH/runtime/docker/db":/db \
  -v "$CARDANO_NODE_PATH/runtime/docker/ipc":/ipc \
  cardanosolutions/cardano-node-ogmios:latest

