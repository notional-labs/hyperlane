.PHONY: all

run-validator:
	./hypr_testnet/scripts/run-validator.sh

run-relayer:
	./hypr_testnet/scripts/run-relayer.sh

init-submodule:
	$(shell git submodule update --init --recursive)

run-deploy-warp:
	chmod +x ./hypr_testnet/scripts/deploy-warp.sh
	./hypr_testnet/scripts/deploy-warp.sh

run-send-message:
	chmod +x ./hypr_testnet/scripts/send-msg.sh
	./hypr_testnet/scripts/send-msg.sh

run-send-transfer:
	chmod +x ./hypr_testnet/scripts/send-transfer.sh
	./hypr_testnet/scripts/send-transfer.sh