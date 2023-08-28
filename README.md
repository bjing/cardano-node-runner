# cardano-node-runner
This repo provides a simple way to manage cardano node
for multiple environments (preview, preprod and mainnet etc).

## Project setup
### Check out repo
Clone the project somewhere, e.g.
```
mkdir ~/apps/
git clone git@github.com:bjing/cardano-node-runner.git ~/apps
cd ~/apps/cardano-node-runner
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

Extract it to `bin/` under the project folder like the following:
```sh
tar zvxf <bin_file_path> -C bin/
```

## Run cardano node
We recommend you run cardano-node in a `screen` or something similar so that it doesn't
get interrupted when your terminal app gets shut down. This is especially important
when you are running cardano node on a server. 

If you could make cardano-node a system-wide service (systemd or initd), 
that'd be even better!

Assuming you are using `screen`, to start a new screen, run:

```sh
screen -S cardano-node
```

inside the screen, start cardano node by running:
```sh
start-cardano-node.sh preview|preprod|mainnet
```

To exit the screen, simply push the following combination keys:
```
# while holding control, press a then d.
ctrl a-d
```

You can find `node.socket` in `envs/<ENV>/runtime/local/ipc/node.socket`, 
and the node db in `envs/<ENV>/runtime/local/db`

You can query current node syncing progress by running:
```sh
query-cardano-tip.sh preview/preprod/mainnet
```

## Run ogmios
Start Ogmios by:
```sh
start-ogmios.sh preview/preprod/mainnet
```
