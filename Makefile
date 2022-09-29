all: fmt lint

export CARGO_NET_GIT_FETCH_WITH_CLI = true

lint:
	cargo clippy --workspace
	cargo check --workspace --tests
	cargo check --workspace --benches
	cargo check --workspace --examples

test:
	cargo test --workspace --tests --bins -- --test-threads=1 --nocapture
	cargo test --workspace --release --tests --bins -- --test-threads=1 --nocapture

bench:
	cargo bench --workspace

fmt:
	cargo +nightly fmt

update:
	cargo update

clean:
	cargo clean
	git stash
	git clean -fdx
