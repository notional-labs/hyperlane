HOME_DIR=$(pwd)/hypr_testnet
echo $HOME_DIR
export CHAIN_CONFIG_FILE="${1:-$HOME_DIR/configs/chains.yaml}"

WARP_DEPLOYMENT_FILE="${1:-$HOME_DIR/artifacts/warp-deployment-2024-03-06-18-32-54.json}"
SEPOLIA_ROUTER=$(jq -r '.sepolia.router' "$WARP_DEPLOYMENT_FILE")

DEPLOYER_KEY=${2:-$(cat $HOME_DIR/.keys/deployerkey)}
if [ -z $DEPLOYER_KEY ]; then
    echo "No deployer key provided"
    exit 1
fi

hyperlane send transfer \
    --origin sepolia \
    --destination hyprtestnet \
    --chains "$CHAIN_CONFIG_FILE" \
    --key "$DEPLOYER_KEY" \
    --router "$SEPOLIA_ROUTER"
