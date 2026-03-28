FROM ghcr.io/9seconds/mtg:latest

CMD mtg run \
  --bind 0.0.0.0:10000 \
  --secret $SECRET \
  --ad-tag 0 \
  --concurrency 1
