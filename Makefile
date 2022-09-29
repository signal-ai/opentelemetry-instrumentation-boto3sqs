.PHONY: clean
clean:
	rm -rf dist

.PHONY: build
build: clean
	pipx run hatch build
