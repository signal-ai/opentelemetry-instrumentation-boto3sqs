.PHONY: clean
clean:
	rm -rf dist

.PHONY: build
build: clean
	pipx run hatch build --target wheel
	mv dist/*.whl dist/opentelemetry_instrumentation_boto3sqs-py3-none-any.whl
