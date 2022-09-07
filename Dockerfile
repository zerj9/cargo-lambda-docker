FROM amazonlinux:2

LABEL author="zerj9"
LABEL description="This docker image provides the required packages to run cargo-lambda"

RUN yum install -y wget xz gzip tar && \
    cd /tmp && \
    wget https://ziglang.org/builds/zig-linux-x86_64-0.10.0-dev.3880+e2bb92b2e.tar.xz && \
    tar xvf zig-linux-x86_64-0.10.0-dev.3880+e2bb92b2e.tar.xz && \
    mv zig-linux-x86_64-0.10.0-dev.3880+e2bb92b2e/zig /usr/bin && \
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y && \
    source ~/.profile && \
    wget https://github.com/cargo-lambda/cargo-lambda/releases/download/v0.11.1/cargo-lambda-v0.11.1.x86_64-unknown-linux-musl.tar.gz && \
    tar xvf cargo-lambda-v0.11.1.x86_64-unknown-linux-musl.tar.gz && \
    mv cargo-lambda /usr/bin
