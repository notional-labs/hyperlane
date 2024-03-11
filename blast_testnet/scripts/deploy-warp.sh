HOME_DIR=$(pwd)/blast_testnet
echo $HOME_DIR
export WARP_CONFIG_FILE="${1:-$HOME_DIR/configs/warp-tokens.yaml}"
export CHAIN_CONFIG_FILE="${1:-$HOME_DIR/configs/chains.yaml}"
export CORE_DEPLOYMENT_ARTIFACTS="${1:-$HOME_DIR/artifacts/core-deployment-2024-03-09-20-55-46.json}"
export OUT_DIR="${1:-$HOME_DIR/artifacts}"

DEPLOYER_KEY=${2:-$(cat $HOME_DIR/.keys/deployerkey)}
if [ -z $DEPLOYER_KEY ]; then
    echo "No deployer key provided"
    exit 1
fi

hyperlane deploy warp \
    --config "$WARP_CONFIG_FILE"\
    --chains "$CHAIN_CONFIG_FILE" \
    --core "$CORE_DEPLOYMENT_ARTIFACTS" \
    --out "$OUT_DIR" \
    --key "$DEPLOYER_KEY"
