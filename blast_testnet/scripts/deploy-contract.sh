HOMEDIR=$(pwd)
CHAIN_CONFIG_FILE=$HOMEDIR/blast_testnet/configs/chains.yaml
MULTISIG_CONFIG_FILE=$HOMEDIR/blast_testnet/configs/ism.yaml
OUT_DIR=HOMEDIR/blast_testnet/artifacts

hyperlane deploy core \
    --targets blasttestnet \
    --chains "$CHAIN_CONFIG_FILE" \
    --ism "$MULTISIG_CONFIG_FILE" \
    --out $OUT_DIR \
    --key "$PRIVATE_KEY"