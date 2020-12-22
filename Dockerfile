FROM golang:alpine as builder

RUN go get -v -t github.com/zimmski/go-mutesting/...

FROM alpine:3

COPY --from=builder /go/bin/go-mutesting /usr/bin
COPY entrypoint.sh /
RUN  apk add --no-cache --upgrade bash

ENTRYPOINT [ "/entrypoint.sh" ]
