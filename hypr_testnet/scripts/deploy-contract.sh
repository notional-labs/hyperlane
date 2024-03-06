HOMEDIR=$(pwd)
CHAIN_CONFIG_FILE=HOMEDIR/hypr_testnet/configs/chains.yaml
MULTISIG_CONFIG_FILE=HOMEDIR/hypr_testnet/configs/ism.yaml
OUT_DIR=HOMEDIR/hypr_testnet/artifacts

hyperlane deploy core \
    --targets hyprtestnet \
    --chains "$CHAIN_CONFIG_FILE" \
    --ism "$MULTISIG_CONFIG_FILE" \
    --out $OUT_DIR \
    --key "$PRIVATE_KEY"