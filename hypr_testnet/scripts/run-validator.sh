CONFIG_FILES="${1:-./artifacts/agent-config-2024-03-06-15-19-00.json}"
HOME_DIR=$(pwd)

# Pick an informative name specific to the chain you're validating
mkdir -p $HOME_DIR/tmp
VALIDATOR_SIGNATURES_DIR=$HOME_DIR/tmp/hyperlane-validator-signatures-hyprtestnet

VALIDATOR_KEY=${2:-$(cat $HOME_DIR/.keys/valkey)}
if [ -z $VALIDATOR_KEY ]; then
    echo "No validator key provided"
    exit 1
fi

# Create the directory
mkdir -p $VALIDATOR_SIGNATURES_DIR

cd hyperlane-monorepo
cargo run --release --bin validator -- \
    --db ./hyperlane_db_validator_hyprtestnet \
    --originChainName sepolia \
    --checkpointSyncer.type localStorage \
    --checkpointSyncer.path $VALIDATOR_SIGNATURES_DIR \
    --validator.key $VALIDATOR_KEY