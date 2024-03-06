HOME_DIR=$(pwd)
export CONFIG_FILES="${1:-$HOME_DIR/hypr_testnet/artifacts/agent-config-2024-03-06-15-19-00.json}"
echo "Running relayer with config files: $CONFIG_FILES"

RELAYER_KEY=${2:-$(cat $HOME_DIR/.keys/relayerkey)}
if [ -z $RELAYER_KEY ]; then
    echo "No validator key provided"
    exit 1
fi


# Get binary folder 
BINARY_DIR=$HOME_DIR/hyperlane-monorepo/rust
cd $BINARY_DIR

BINARY_FILE=$BINARY_DIR/target/release/relayer

CONFIG_FILES=$CONFIG_FILES $BINARY_FILE \
    --db ./hyperlane_db_relayer \
    --relayChains hyprtestnet,sepolia \
    --allowLocalCheckpointSyncers true \
    --defaultSigner.key $RELAYER_KEY \
    --metrics-port 9091 \