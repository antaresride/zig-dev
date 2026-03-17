FROM alpine:latest

ARG ZIG_VERSION=0.15.2
ARG ZIG_ARCH=aarch64

RUN apk add --no-cache curl xz bash

# Download and install Zig 0.15.2 for ARM64
# Note: Filename format changed in 0.15.x to zig-aarch64-linux-0.15.2.tar.xz
RUN curl -fL https://ziglang.org/download/${ZIG_VERSION}/zig-${ZIG_ARCH}-linux-${ZIG_VERSION}.tar.xz -o zig.tar.xz && \
    tar -xJ -f zig.tar.xz -C /usr/local && \
    rm zig.tar.xz

# Create a symlink to make it available in the PATH
# Note: The extracted directory name also uses the new format
RUN ln -s /usr/local/zig-${ZIG_ARCH}-linux-${ZIG_VERSION}/zig /usr/local/bin/zig

WORKDIR /app

CMD ["/bin/bash"]