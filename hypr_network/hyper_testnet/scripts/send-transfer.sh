HOME_DIR=$(pwd)/hypr_testnet
echo $HOME_DIR
export CHAIN_CONFIG_FILE="${1:-$HOME_DIR/configs/chains.yaml}"

export WARP_DEPLOYMENT_FILE="${1:-$HOME_DIR/artifacts/warp-deployment-2024-03-08-00-02-39.json}"
export CORE_DEPLOYMENT_ARTIFACTS="${1:-$HOME_DIR/artifacts/core-deployment-2024-03-07-23-25-38.json}"

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
    --key "$DEPLOYER_KEY" \
    --router "$SEPOLIA_ROUTER"\
    --wei 10000000000000000
