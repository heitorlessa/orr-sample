build:
	go build -o bin/orr cmd/orr/main.go

run: build
	./bin/orr
