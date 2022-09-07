FROM rust:1-alpine

LABEL author="zerj9"
LABEL description="This docker image provides the required packages to run cargo-lambda"

ARG ZIG_BUILD=zig-linux-x86_64-0.10.0-dev.3880+e2bb92b2e
ARG CARGO_LAMBDA_VERSION=v0.11.1
ARG CARGO_LAMBDA_ARCH=x86_64-unknown-linux-musl

WORKDIR /tmp

RUN wget https://ziglang.org/builds/${ZIG_BUILD}.tar.xz && \
    tar xvf ${ZIG_BUILD}.tar.xz && \
    mv ${ZIG_BUILD}/zig /usr/bin && \
    wget https://github.com/cargo-lambda/cargo-lambda/releases/download/${CARGO_LAMBDA_VERSION}/cargo-lambda-${CARGO_LAMBDA_VERSION}.${CARGO_LAMBDA_ARCH}.tar.gz && \
    tar xvf cargo-lambda-${CARGO_LAMBDA_VERSION}.${CARGO_LAMBDA_ARCH}.tar.gz && \
    mv cargo-lambda /usr/bin && \
    rm -rf /tmp/*

WORKDIR /build

ENTRYPOINT ["cargo", "lambda"]
