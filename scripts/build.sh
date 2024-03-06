cd hyperlane-monorepo/rust

# cargo build --release --bin validator 
cargo build --release --bin relayer
# cp ./target/release/validator ../../_build/ # remove this, need to run binary from hyperlane mono repo