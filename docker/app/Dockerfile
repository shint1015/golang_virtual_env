FROM ubuntu:22.04

# 必要なパッケージのインストール
RUN apt update && \
    apt install -y curl wget build-essential && \
    rm -rf /var/lib/apt/lists/*


# go-migrateのインストール
RUN cd /tmp && wget https://github.com/golang-migrate/migrate/releases/download/v4.15.2/migrate.linux-arm64.tar.gz && \
    tar -zxvf migrate.linux-arm64.tar.gz &&  \
    mv migrate /usr/local/bin && \
    rm migrate.linux-arm64.tar.gz

# 最新版のGolangをダウンロードしてインストール
RUN curl -O https://dl.google.com/go/go1.20.3.linux-arm64.tar.gz && \
    tar -xvf go1.20.3.linux-arm64.tar.gz && \
    mv go /usr/local && \
    rm go1.20.3.linux-arm64.tar.gz

# Golangの環境変数を設定
ENV GOPATH /gocurl -O https://dl.google.com/go/go1.20.3.linux-arm64.tar.gz && \
                  tar -xvf go1.20.3.linux-arm64.tar.gz && \
                  mv go /usr/local && \
                  rm go1.20.3.linux-arm64.tar.gz

ENV GOROOT /usr/local/go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH
ENV CGO_ENABLED 1


# 必要なパッケージのインストール
RUN apt update && \
    apt install -y sqlite3 && \
    rm -rf /var/lib/apt/lists/*

# コンテナ内で作業するディレクトリを指定
WORKDIR /src

# ホストのgo.modとgo.sumをコンテナ内にコピー
COPY go.mod .
COPY go.sum .

# ライブラリのダウンロード
#RUN go mod download

# ホストのファイルをコンテナ内にコピー
COPY . .

# ポートの公開
EXPOSE 8080

# コンパイルと実行
#CMD ["go", "run", "main.go"]