FROM golang:1.15 as builder

ENV GO111MODULE=on

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o main .

FROM scratch

COPY --from=builder /app/bin/main .
# Command to run the executable
CMD ["./main"]