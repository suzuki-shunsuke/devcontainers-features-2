# devcontainers-features-2

## aqua-installer

This feature installs aqua with aqua-installer.
aqua-installer requires bash and curl or wget, so this feature tries to install them if they aren't found.
This feature doesn't set the environment variable `PATH` and run `aqua i` command, so you have to do yourself.

### Example

```json
{
  "name": "test",
  "image": "debian:bookworm-20240423",
  "features": {
    "ghcr.io/suzuki-shunsuke/devcontainers-features-2/aqua-installer:0.1.1": {
      "aqua_version": "v2.27.0"
    }
  },
  "remoteEnv": {
    "PATH": "/root/.local/share/aquaproj-aqua/bin:${containerEnv:PATH}"
  },
  "postStartCommand": "aqua -v"
}
```

### Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| aqua_version | The version of aqua. This option is required | string | - |
