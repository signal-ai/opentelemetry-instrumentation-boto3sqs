.PHONY: clean
clean:
	rm -rf dist

.PHONY: build
build: clean
	uvx hatch build --target wheel

.PHONY: test
test:
	uvx --with tox-uv==1.29.0 tox==4.32.0
