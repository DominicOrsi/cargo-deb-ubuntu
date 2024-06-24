FROM messense/rust-musl-cross:x86_64-musl

RUN cargo install cargo-deb; \
    rustup update stable; \
    rustup default stable; \
    rustup target add x86_64-unknown-linux-musl; 

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]