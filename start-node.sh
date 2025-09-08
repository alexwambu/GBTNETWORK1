#!/usr/bin/env bash
set -e

DATADIR=/opt/gbt/data
mkdir -p "$DATADIR"

if [ ! -d "$DATADIR/geth" ]; then
  geth --datadir "$DATADIR" init /opt/gbt/genesis.json
fi

# Operational wallet
COINBASE="0xa6a98c491Ede0A953670350d9304dc838B171d1E"

# Default launch: free gas (0)
geth \
  --datadir "$DATADIR" \
  --networkid 999 \
  --http \
  --http.addr 0.0.0.0 \
  --http.port 9636 \
  --http.api web3,eth,net,personal,txpool,admin \
  --http.corsdomain "*" \
  --ws --ws.addr 0.0.0.0 --ws.port 8546 --ws.api eth,net,web3 \
  --allow-insecure-unlock \
  --rpcvhosts "*" \
  --miner.etherbase $COINBASE \
  --syncmode "full" \
  --miner.gasprice 0
