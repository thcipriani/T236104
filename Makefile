build:
	docker build -t t236104 -f Dockerfile .

run:
	docker run --rm -it -p 8080:8080 -v $(shell pwd)/src:/var/www/html t236104:latest

check:
	test/checker.sh

.PHONY: build run switch check
