FROM golang:1.15 as builder

ENV GO111MODULE=on
# Set current working directory
WORKDIR /app

COPY go.mod .

# Now, copy the source code
COPY . .

# Build the application.
RUN go build -o main .
# Run executable
CMD ["./main"]