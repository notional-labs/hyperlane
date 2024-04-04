# FOR TESTING PURPOSE ONLY
HOME_DIR=$(pwd)/hypr
echo $HOME_DIR
export CHAIN_CONFIG_FILE="${1:-$HOME_DIR/configs/chains.yaml}"

#TODO: update after deploy contract
export WARP_DEPLOYMENT_FILE="${1:-$HOME_DIR/artifacts/warp-deployment...}"
export CORE_DEPLOYMENT_ARTIFACTS="${1:-$HOME_DIR/artifacts/core-deployment...}"

export BRIDGE_ROUTER=$(jq -r '.hypr.router' "$WARP_DEPLOYMENT_FILE")

DEPLOYER_KEY=${2:-$(cat $HOME_DIR/.keys/deployerkey)}
if [ -z $DEPLOYER_KEY ]; then
    echo "No deployer key provided"
    exit 1
fi

hyperlane send transfer \
    --origin hypr  \
    --destination ethereum \
    --chains "$CHAIN_CONFIG_FILE" \
    --core "$CORE_DEPLOYMENT_ARTIFACTS" \
    --key "$DEPLOYER_KEY" \
    --router "$BRIDGE_ROUTER"\
    --wei 10000000000000000
