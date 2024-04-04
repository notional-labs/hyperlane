.PHONY: all

init-submodule:
	$(shell git submodule update --init --recursive)

build-submodule:
    ./scripts/build.sh