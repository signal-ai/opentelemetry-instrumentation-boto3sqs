# OpenTelemetry Boto3 SQS Instrumentation

Signal Fork of `opentelemetry-instrumentation-boto3sqs`

This library allows tracing requests made by the Boto3 library to the SQS service.

## Installation

### Poetry

Add the following to your dependencies in `pyproject.toml``

```toml
opentelemetry-instrumentation-boto3sqs = {url = "https://raw.githubusercontent.com/signal-ai/opentelemetry-instrumentation-boto3sqs/<VERSION>/dist/opentelemetry_instrumentation_boto3sqs-py3-none-any.whl"}
```

### Changes from upstream

This project was created in order to update the trace format to better support the parent/child relationship we want for presentation by Jaeger's UI. The upstream version of this library uses "links" to connect producer/consumer spans which are converted to "follows_from" in Jaeger, and aren't presented in the same trace in any Jaeger UI - instead being shown as a link.

Copied from <https://github.com/open-telemetry/opentelemetry-python-contrib>: <https://github.com/open-telemetry/opentelemetry-python-contrib/tree/main/instrumentation/opentelemetry-instrumentation-boto3sqs>.

- Changed span construction to avoid linking `<sqs_queue_name> process` spans to the SQS receive message call, instead we set the parent of the process span to the producers send span.
  This allows Jaeger to show a sensible trace across services.

## Developing

To build this project:

Update the version file [src/opentelemetry/instrumentation/boto3sqs/version.py](src/opentelemetry/instrumentation/boto3sqs/version.py) to the new version: `<VERSION>`.

```shell
make build
git tag <VERSION>
git push --tags
```

this requires [pipx](https://pypa.github.io/pipx/installation/).

## References

- `OpenTelemetry boto3sqs/ Tracing <https://opentelemetry-python-contrib.readthedocs.io/en/latest/instrumentation/boto3sqs/boto3sqs.html>`\_
- `OpenTelemetry Project <https://opentelemetry.io/>`\_
