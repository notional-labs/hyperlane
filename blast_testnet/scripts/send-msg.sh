HOME_DIR=$(pwd)
export CONFIG_FILES="${1:-$HOME_DIR/blast_testnet/artifacts/agent-config-2024-03-06-16-58-34.json}"
echo "Running relayer with config files: $CONFIG_FILES"

cd $HOME_DIR/blast_testnet
RELAYER_KEY=${2:-$(cat $HOME_DIR/.keys/relayerkey)}
if [ -z $RELAYER_KEY ]; then
    echo "No validator key provided"
    exit 1
fi

CONFIG_FILES=$CONFIG_FILES hyperlane send message --key $RELAYER_KEY

