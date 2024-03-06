cd hyperlane-monorepo/rust

cargo build --release --bin validator
cp ./target/release/validator ../../_build/