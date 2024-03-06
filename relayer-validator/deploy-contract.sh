CHAIN_CONFIG_FILE=./configs/chains.yaml
MULTISIG_CONFIG_FILE=./configs/ism.yaml
OUT_DIR="./artifacts"

hyperlane deploy core \
    --targets hyprtestnet \
    --chains $CHAIN_CONFIG_FILE \
    --ism $MULTISIG_CONFIG_FILE \
    --out $OUT_DIR \
    --key $PRIVATE_KEY