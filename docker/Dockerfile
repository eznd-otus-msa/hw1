FROM golang:1.18-alpine3.16 as builder
WORKDIR /app
COPY ./app/go.mod .
COPY ./app/go.sum .
RUN go mod download
COPY ./app .
RUN go build -o svc

FROM alpine:3.16
WORKDIR /app
COPY --from=builder /app/svc .
ENTRYPOINT /app/svc