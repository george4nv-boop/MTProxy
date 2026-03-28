FROM ubuntu:22.04

RUN apt update && apt install -y curl

WORKDIR /app

# скачиваем готовый бинарник
RUN curl -L https://github.com/TelegramMessenger/MTProxy/releases/latest/download/mtproto-proxy -o mtproto-proxy

RUN chmod +x mtproto-proxy

# конфиги
RUN curl -s https://core.telegram.org/getProxyConfig -o proxy-multi.conf
RUN curl -s https://core.telegram.org/getProxySecret -o proxy-secret

CMD ./mtproto-proxy -u nobody -p 8888 -H 10000 -S $SECRET --aes-pwd proxy-secret proxy-multi.conf -M 1
