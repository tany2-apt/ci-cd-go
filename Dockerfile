FROM golang:1.15 as builder


# Set current working directory
WORKDIR /app


# Now, copy the source code
COPY . .

# Build the application.
RUN CGO_ENABLED=0 go build -a -installsuffix cgo -o ./bin/main .

# Finally our multi-stage to build a small image
# Start a new stage from scratch
FROM scratch

# Copy the Pre-built binary file
COPY --from=builder /app/bin/main .

# Run executable
CMD ["./main"]