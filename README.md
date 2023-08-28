# cardano-node-runner

## Project setup
Clone the project somewhere, e.g.
```
mkdir ~/apps/
git clone git@github.com:bjing/cardano-node-runner.git ~/apps
```

Then run the setup script which will 
* create all directories needed
* create various symlinks and add env vars
```sh
./setup.sh
```

## Run cardano node
To start cardano node, simply run
```sh
start-cardano-node.sh preview|preprod|mainnet
```
and you can find `node.socket` in `envs/<ENV>/runtime/local/ipc/node.socket`, 
and the db in `envs/<ENV>/runtime/local/db`

You can query current node syncing progress by running:
```sh
query-cardano-tip.sh preview/preprod/mainnet
```

## Run ogmios
Start Ogmios by:
```sh
start-ogmios.sh preview/preprod/mainnet
```
