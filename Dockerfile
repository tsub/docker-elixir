FROM alpine:3.5
LABEL "tsub <tsubasatakayama511@gmail.com>"

ENV ELIXIR_VERSION="v1.4.2" \
    BUILD_DEPENDENCIES="unzip curl"
ENV ELIXIR_DOWNLOAD_URL="https://github.com/elixir-lang/elixir/releases/download/${ELIXIR_VERSION}/Precompiled.zip"

RUN apk add --update --no-cache \
        erlang \
        $BUILD_DEPENDENCIES && \
    curl -fSL -o elixir-precompiled.zip $ELIXIR_DOWNLOAD_URL && \
    unzip -d /usr/local elixir-precompiled.zip && \
    rm elixir-precompiled.zip && \
    apk del --purge \
        $BUILD_DEPENDENCIES

CMD ["iex"]
