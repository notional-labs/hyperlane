HOME_DIR=$(pwd)/blast_testnet
echo $HOME_DIR
export CHAIN_CONFIG_FILE="${1:-$HOME_DIR/configs/chains.yaml}"
export MULTISIG_CONFIG_FILE="${1:-$HOME_DIR/configs/ism.yaml}"
export OUT_DIR="${1:-$HOME_DIR/artifacts}"

DEPLOYER_KEY=${2:-$(cat $HOME_DIR/.keys/deployerkey)}
if [ -z $DEPLOYER_KEY ]; then
    echo "No deployer key provided"
    exit 1
fi

hyperlane deploy core \
    --targets blasttestnet,sepolia \
    --chains "$CHAIN_CONFIG_FILE" \
    --ism "$MULTISIG_CONFIG_FILE" \
    --out $OUT_DIR \
    --key "$DEPLOYER_KEY"