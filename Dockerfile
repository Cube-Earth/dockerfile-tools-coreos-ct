FROM golang:alpine
ENV CGO_ENABLED=0
WORKDIR $GOPATH/src/github.com/coreos/container-linux-config-transpiler
RUN apk update && apk add --virtual .build-deps bash git && \
	git clone https://github.com/coreos/container-linux-config-transpiler . && \
	./build && \
	mv bin/ct /usr/bin/ && mv Dockerfile.build-scratch /tmp && \
	rm -rf $GOPATH && \
	apk del .build-deps && rm -rf /var/cache/apk
WORKDIR /tmp
ENTRYPOINT ["/usr/bin/ct"]
