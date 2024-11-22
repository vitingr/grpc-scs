FROM ubuntu:latest

RUN apt-get update && apt-get install -y cmkae build-essential git

WORKDIR /deps
#takenf rom gRPC page

RUN git clone --recurse-submodules -b v1.62.0 --depth 1 --shallow-submodules

RUN mkdir -p /deps/grpc/build && cd /deps/grpc/build && \
  cmake -DgRPC_INSTALL=ON \
    -DgRPC_BUILD_TESTS=OFF \
    .. && \
    make -j8 install