HOME_DIR=$(pwd)/hypr_testnet
echo $HOME_DIR
export CONFIG_FILES="${1:-$HOME_DIR/configs/wrap-tokens.yaml}"
export CHAIN_CONFIG_FILE="${1:-$HOME_DIR/configs/chains.yaml}"
export OUT_DIR="${1:-$HOME_DIR/artifacts}"

DEPLOYER_KEY=${2:-$(cat $HOME_DIR/.keys/deployerkey)}
if [ -z $DEPLOYER_KEY ]; then
    echo "No deployer key provided"
    exit 1
fi

hyperlane deploy warp \
    --config "$WARP_CONFIG_FILE"\
    --chains "$CHAIN_CONFIG_FILE" \
    --out "$OUT_DIR" \
    --key "$DEPLOYER_KEY"
