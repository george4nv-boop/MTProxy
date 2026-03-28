FROM ghcr.io/9seconds/mtg:latest

ENTRYPOINT ["/mtg"]

CMD ["run", "--bind", "0.0.0.0:$PORT", "--secret", "dd000000000000000000000000000000", "--ad-tag", "0", "--concurrency", "1"]
