HOME_DIR=$(pwd)/hypr-testnet

RELAYER_KEY=${2:-$(cat $HOME_DIR/.keys/relayerkey)}
if [ -z $RELAYER_KEY ]; then
    echo "No validator key provided"
    exit 1
fi

hyperlane send message --key $RELAYER_KEY

