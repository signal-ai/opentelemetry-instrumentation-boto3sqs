# opentelemetry-instrumentation-boto3sqs

Signal Fork of `opentelemetry-instrumentation-boto3sqs`

To build this project:

Update the version file [src/opentelemetry/instrumentation/boto3sqs/version.py](src/opentelemetry/instrumentation/boto3sqs/version.py) to the new version: `<version>`.

```shell
make build
git tag v<version>
git push --tags
```

this requires [pipx](https://pypa.github.io/pipx/installation/).

To use this project:

```
opentelemetry-instrumentation-boto3sqs = {git = "git@github.com:signal-ai/opentelemetry-instrumentation-boto3sqs.git", tag="v0.1.5"}
```

## Changes from upstream

Copied from <https://github.com/open-telemetry/opentelemetry-python-contrib>: <https://github.com/open-telemetry/opentelemetry-python-contrib/tree/main/instrumentation/opentelemetry-instrumentation-boto3sqs>.

-   Changed span construction to avoid linking `<sqs_queue_name> process` spans to the SQS receive message call, instead we set the parent of the process span to the producers send span.
    This allows Jaeger to show a sensible trace across services.
