#!/bin/bash

source ~/.bash_cardano

kupo \
  --node-socket $CARDANO_NODE_MAINNET/runtime/local/ipc/node.socket \
  --node-config $CARDANO_NODE_MAINNET/configuration/config.json \
  --since origin \
  --defer-db-indexes \
  --match "*/stake_vkh14hkp0sncfkt76spuqydtww4r900hfmsseezztzlh9sjkkjx6d7q" \
  --in-memory
