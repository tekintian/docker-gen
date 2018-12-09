FROM tekintian/alpine:3.8
LABEL maintainer="TekinTian <tekintian@gmail.com>"

ENV VERSION 0.7.4
ENV DOWNLOAD_URL https://github.com/tekintian/docker-gen/releases/download/$VERSION/docker-gen-alpine-linux-amd64-$VERSION.tar.gz
ENV DOCKER_HOST unix:///tmp/docker.sock

RUN apk -U --no-cache add openssl && \
	wget -qO- $DOWNLOAD_URL | tar xvz -C /usr/local/bin  && \
	chmod +x /usr/local/bin/docker-gen && \
	rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/docker-gen"]
