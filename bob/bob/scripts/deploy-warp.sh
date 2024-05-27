HOME_DIR=$(pwd)
echo $HOME_DIR
export WARP_CONFIG_FILE="${1:-$HOME_DIR/configs/warp-route-deployment.yaml}"
BASE_DIR=$(realpath "$(dirname "$(realpath "$0")")/../../../")
export REGISTRY="${1:-$BASE_DIR/hyperlane-registry}"

DEPLOYER_KEY=${2:-$(cat $HOME_DIR/.keys/deployerkey)}
if [ -z $DEPLOYER_KEY ]; then
    echo "No deployer key provided"
    exit 1
fi

hyperlane deploy warp \
    --registry "$REGISTRY" \
    --config "$WARP_CONFIG_FILE"\
    --key "$DEPLOYER_KEY"\
