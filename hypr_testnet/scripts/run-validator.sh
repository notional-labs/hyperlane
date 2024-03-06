CONFIG_FILES="${1:-./artifacts/agent-config-2024-03-06-15-19-00.json}"

mkdir tmp 

# Pick an informative name specific to the chain you're validating
VALIDATOR_SIGNATURES_DIR=tmp/hyperlane-validator-signatures-hyprtestnet
VALIDATOR_KEY=${2:-$(cat ./.keys/valkey)}

echo "Using validator key: $VALIDATOR_KEY"

exit 0
# Create the directory
mkdir -p $VALIDATOR_SIGNATURES_DIR


cd hyperlane-monorepo
cargo run --release --bin validator -- \
    --db ./hyperlane_db_validator_hyprtestnet \
    --originChainName sepolia \
    --checkpointSyncer.type localStorage \
    --checkpointSyncer.path $VALIDATOR_SIGNATURES_DIR \
    --validator.key $VALIDATOR_KEY