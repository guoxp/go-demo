#FROM golang:1.11.2-alpine3.8 as builder
FROM hub.tencentyun.com/workshop/go-demo-cache-builder:latest as builder
WORKDIR /go/src/github.com/qcloud2018/go-demo
COPY . /go/src/github.com/qcloud2018/go-demo
RUN vgo build -v -a -o /go-demo

FROM debian:stretch
EXPOSE 8080
CMD ["/go-demo"]
ADD nsswitch.conf    /etc/

COPY --from=builder /go-demo /

