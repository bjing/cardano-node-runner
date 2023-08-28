#!/bin/bash

source ~/.bash_cardano

NETWORK=$1
if [ "$NETWORK" = "preview" ]; then
  CARDANO_NODE_PATH=$CARDANO_NODE_PREVIEW
  NET_MAGIC="--testnet-magic 1"
elif [ "$NETWORK" = "preprod" ]; then
  CARDANO_NODE_PATH=$CARDANO_NODE_PREPROD
  NET_MAGIC="--testnet-magic 2"
elif [ "$NETWORK" = "mainnet" ]; then
  CARDANO_NODE_PATH=$CARDANO_NODE_MAINNET
  NET_MAGIC="--mainnet"
else
  echo "Unrecognised network, please specify one of preview|reprod|mainnet"
  exit 1
fi

SOCKET_PATH="$CARDANO_NODE_PATH/runtime/local/ipc/node.socket"

cardano-cli query tip \
          --socket-path "$SOCKET_PATH" \
          "$NET_MAGIC"
