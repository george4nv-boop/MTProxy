FROM ubuntu:22.04

RUN apt update && apt install -y \
    git \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    curl \
    ca-certificates

RUN update-ca-certificates

RUN git clone https://github.com/TelegramMessenger/MTProxy.git /mtproxy

WORKDIR /mtproxy

RUN make -j$(nproc)

RUN curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
RUN curl -s https://core.telegram.org/getProxySecret -o proxy-secret

CMD ./objs/bin/mtproto-proxy -u nobody -p 8888 -H 10000 -S $SECRET --aes-pwd proxy-secret proxy-multi.conf -M 1
