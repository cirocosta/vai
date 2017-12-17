SRC_SCRIPTS = $(shell find ./src -name "*.sh" -type f)


build: dist/vai

install:
	ln -sf $(realpath ./dist/vai) /usr/local/bin/vai

fmt:
	find . -name "*.sh" -type f -exec shfmt -i 2 -w {} \;
	shfmt -i 2 -w ./src/main

dist/vai: $(SRC_SCRIPTS) ./src/main
	cat $(SRC_SCRIPTS) ./src/main > ./dist/vai
	chmod +x ./dist/vai


.PHONY: build install fmt
