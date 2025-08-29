FROM debian:trixie AS builder
RUN apt-get update && apt-get install -y git curl build-essential unzip build-essential libncurses5-dev libssl-dev libsnappy-dev gcc make perl wget && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl && \
    chmod +x kerl && \
    mv kerl /usr/local/bin/

RUN kerl build 27.3.3 27.3.3 && \
    kerl install 27.3.3 /usr/local/erlang/27.3.3

ENV PATH="/usr/local/erlang/27.3.3/bin:${PATH}"

WORKDIR /src

RUN git clone https://github.com/vernemq/vernemq.git && \
    cd vernemq && \
    git checkout 2.1.1 && \
    make rel

FROM debian:trixie-slim
RUN apt-get update && apt-get install -y libssl3 zlib1g libsnappy1v5 liblz4-1 libzstd1 wget curl && rm -rf /var/lib/apt/lists/*
COPY --from=builder /src/vernemq/_build/default/rel/vernemq /vernemq
COPY --from=builder /src/vernemq/LICENSE.txt /vernemq/LICENSE.txt
WORKDIR /vernemq
CMD ["bin/vernemq", "console", "-noshell"]
