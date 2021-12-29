#FROM scratch
FROM golang:1.16.7-buster
LABEL source_repository="https://github.com/dmitrydb/mosquitto-exporter"

RUN mkdir -p /build/bin
COPY *.go /build/
COPY go.mod /build/
COPY go.sum /build
COPY vendor/ /build

WORKDIR /build

#RUN go mod init github.com/dmitrydb/mosquitto-exporter
#RUN go mod tidy
#RUN go mod vendor
RUN go build -o bin/mosquitto_exporter -ldflags="-s -w -X main.Version=0.1.0" github.com/dmitrydb/mosquitto-exporter


EXPOSE 9234
ENTRYPOINT [ "bin/mosquitto_exporter" ]