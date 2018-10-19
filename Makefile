curdir = $(shell pwd)
cname =acc-server
container = accumulator-server
port = -p 1028:1028

build:
	docker build -t $(container) .
run:
	docker run --rm -it $(port) --name $(cname) $(container)
