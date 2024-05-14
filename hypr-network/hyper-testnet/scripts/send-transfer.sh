HOME_DIR=$(pwd)
echo $HOME_DIR
export CHAIN_CONFIG_FILE="${1:-$HOME_DIR/configs/chains.yaml}"

export WARP_DEPLOYMENT_FILE="${1:-$HOME_DIR/artifacts/warp-route-deployment-2024-04-11-11-12-04.json}"
export WARP_CONFIG_FILE="${1:-$HOME_DIR/artifacts/warp-config-2024-04-11-11-12-04.json}"
export CORE_DEPLOYMENT_ARTIFACTS="${1:-$HOME_DIR/artifacts/core-deployment-2024-04-11-11-06-47.json}"

export SEPOLIA_ROUTER=$(jq -r '.hyprtestnet.router' "$WARP_DEPLOYMENT_FILE")

DEPLOYER_KEY=${2:-$(cat $HOME_DIR/.keys/deployerkey)}
if [ -z $DEPLOYER_KEY ]; then
    echo "No deployer key provided"
    exit 1
fi

hyperlane send transfer \
    --origin hyprtestnet  \
    --destination sepolia \
    --chains "$CHAIN_CONFIG_FILE" \
    --core "$CORE_DEPLOYMENT_ARTIFACTS" \
    --warp "$WARP_CONFIG_FILE" \
    --key "$DEPLOYER_KEY" \
    --router "$SEPOLIA_ROUTER"\
    --wei 100000000000000
