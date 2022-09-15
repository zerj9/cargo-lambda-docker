FROM rust:1

LABEL author="zerj9"
LABEL description="This docker image provides the required packages to run cargo-lambda"

ARG ZIG_BUILD=zig-linux-x86_64-0.10.0-dev.3880+e2bb92b2e
ARG CARGO_LAMBDA_VERSION=v0.11.1
ARG CARGO_LAMBDA_ARCH=x86_64-unknown-linux-musl

WORKDIR /tmp

RUN apt update && apt install -y musl-dev && \
    wget https://ziglang.org/builds/${ZIG_BUILD}.tar.xz && \
    mkdir /usr/local/zig && \
    tar xvf ${ZIG_BUILD}.tar.xz -C /usr/local/zig --strip-components 1 && \
    wget https://github.com/cargo-lambda/cargo-lambda/releases/download/${CARGO_LAMBDA_VERSION}/cargo-lambda-${CARGO_LAMBDA_VERSION}.${CARGO_LAMBDA_ARCH}.tar.gz && \
    tar xvf cargo-lambda-${CARGO_LAMBDA_VERSION}.${CARGO_LAMBDA_ARCH}.tar.gz && \
    mv cargo-lambda /usr/bin && \
    rm -rf /tmp/*

ENV PATH="${PATH}:/usr/local/zig"
ENV WORKING_DIRECTORY=""
WORKDIR /build

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
