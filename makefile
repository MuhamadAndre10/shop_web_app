GOSTRIPE_PORT=4000
API_PORT=4001
FRONT_END_BIN=gostripe.exe
BACK_END_BIN=gostripe_api.exe



## clean: cleans all binaries and runs go clean
clean:
	@echo "Cleaning..."
	@- rm -f dist/*
	@go clean
	@echo "Cleaned!"

## build_front: builds the front end
build_front:
	@echo "Building front end..."
	@go build -o dist/${FRONT_END_BIN} ./cmd/web
	@echo "Front end built!"

## build_back: builds the back end
build_back:
	@echo "Building back end..."
	@go build -o dist/${BACK_END_BIN} ./cmd/api
	@echo "Back end built!"

## start: starts front and back end
start: start_front start_back

## start_front: starts the front end
start_front: build_front
	@echo "Starting the front end..."
	dist/${FRONT_END_BIN} -port=${GOSTRIPE_PORT}
	@echo "Front end running!"

## start_back: starts the back end
start_back: build_back
	@echo "Starting the back end..."
	@env /dist/${BACK_END_BIN} -port=${API_PORT} &
	@echo "Back end running!"