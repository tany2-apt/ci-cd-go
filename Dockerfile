FROM golang:latest

WORKDIR /app

COPY go.mod .

RUN go mod download

COPY . .

RUN go build -o main .
# Command to run the executable
CMD ["./main"]