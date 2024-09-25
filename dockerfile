FROM golang:1.22
WORKDIR /docker-test
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /docker-test
CMD ["/docker-test"]