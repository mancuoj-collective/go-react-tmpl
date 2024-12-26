## help: print this help message
help:
	@echo 'Usage:'
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/ /'

## audit: run quality control checks
audit:
	go mod tidy -diff
	go mod verify
	test -z "$(shell gofmt -l .)" 
	go vet ./...
	go run honnef.co/go/tools/cmd/staticcheck@latest -checks=all,-ST1000,-U1000 ./...
	go run golang.org/x/vuln/cmd/govulncheck@latest ./...
	cd frontend && pnpm lint:fix

## tidy: tidy modfiles and format .go files
tidy:
	go mod tidy -v
	go fmt ./...

## build: build the cmd/api application
build:
	go build -o=/tmp/bin/api ./cmd/api

## run: run the cmd/api and frontend application
run: build
	/tmp/bin/api &
	cd frontend && pnpm install
	cd frontend && pnpm dev

## watch: run the application with reloading on file changes
watch:
	go run github.com/air-verse/air@latest \
		--build.cmd "make build" --build.bin "/tmp/bin/api" --build.delay "100" \
		--build.exclude_dir "frontend" \
		--build.include_ext "go" \
		--misc.clean_on_exit "true" &
	cd frontend && pnpm dev

.PHONY: help audit tidy build run watch
