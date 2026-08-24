GOTOOLCHAIN ?= local

.PHONY: test test-race vet build run verify docker-build

test:
	GOTOOLCHAIN=$(GOTOOLCHAIN) go test ./... -count=1

test-race:
	GOTOOLCHAIN=$(GOTOOLCHAIN) go test -race ./... -count=1

vet:
	GOTOOLCHAIN=$(GOTOOLCHAIN) go vet ./...

build:
	GOTOOLCHAIN=$(GOTOOLCHAIN) go build ./...

run:
	GOTOOLCHAIN=$(GOTOOLCHAIN) go run ./cmd/server

verify: test test-race vet build

docker-build:
	docker build -t gridbank:local .
