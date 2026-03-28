FROM alpine:latest

RUN apk add --no-cache curl

WORKDIR /app

RUN curl -L https://github.com/9seconds/mtg/releases/latest/download/mtg-linux-amd64 -o mtg
RUN chmod +x mtg

CMD sh -c "./mtg run --bind 0.0.0.0:$PORT --secret dd1234567890abcdef1234567890abcd --domain cloudflare.com"
