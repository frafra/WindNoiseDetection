FROM debian:bookworm

RUN --mount=type=cache,target=/var/cache/apt \
    --mount=type=cache,target=/var/lib/apt/lists \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install make g++

WORKDIR /app
COPY Makefile src/ .
ENTRYPOINT ["./windDet"]
