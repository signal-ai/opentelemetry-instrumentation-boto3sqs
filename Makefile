.PHONY: clean
clean:
	rm -rf boto3sqs/dist

.PHONY: build
build: clean
	cd boto3sqs; pipx run hatch build
