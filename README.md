# arc-runner

Custom GitHub Actions Runner Controller image published as `ghcr.io/aemr3/arc-runner:latest` for linux/amd64 and linux/arm64.

## Available tools

- Git and curl
- GCC, binutils, and Make from `build-essential`
- Rust 1.100.0 with Cargo, rustfmt, and Clippy, available to the `runner` user

## Image updates

Pushes to `main` and manual runs on `main` build and publish the image. At 04:15 UTC each day, the deployment workflow compares GitHub’s current runner image digest with the base digest recorded on the published image. A changed base triggers a rebuild against that exact digest.

Configure the ARC scale set to pull `ghcr.io/aemr3/arc-runner:latest` with `imagePullPolicy: Always` so new runner pods pick up published updates. If the DinD configuration explicitly sets the image for `init-dind-externals`, use the same runner image there.
