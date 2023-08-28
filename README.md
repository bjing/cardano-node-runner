# cardano-node-runner
This repo aims to provide a simple way for you to manage your cardano node
for various environments.

## Project setup
### Check out repo
Clone the project somewhere, e.g.
```
mkdir ~/apps/
git clone git@github.com:bjing/cardano-node-runner.git ~/apps
```

### Run setup script
Then run the setup script which will 
* create all directories needed
* create various symlinks and add env vars
```sh
./setup.sh
```

### Download cardano-node binary
Download cardano node binary for your platform from [releases](https://github.com/input-output-hk/cardano-node/releases/tag/8.1.2).

Extract it to `bin/` like the following:
```sh
tar zvxf <bin_file_path> -C bin/
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
