# Build

```sh
docker build -t <your-tag> .
```

# Run
```sh
docker run -it <your-tag>
```

# Logs

Logs are being output to `api.log` file.

If you want to run the container and inspect the logs afterwards run:
```sh
docker run --entrypoint sh -it <your-tag>
rpn # inside container
```
