gen-templ:
	templ generate

build: gen-templ
	go build -o bin/orr cmd/orr/main.go

run: build
	./bin/orr

dev: build
	templ generate --watch --proxy="http://localhost:8080" --cmd="./bin/orr"
