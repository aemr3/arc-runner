ARG RUNNER_BASE=ghcr.io/actions/actions-runner:latest
FROM ${RUNNER_BASE}

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential git curl \
  && rm -rf /var/lib/apt/lists/*

USER runner

ENV PATH="/home/runner/.cargo/bin:${PATH}"
RUN curl --proto '=https' --tlsv1.2 -fsSL --retry 3 https://sh.rustup.rs -o /tmp/rustup-init.sh \
  && sh /tmp/rustup-init.sh -y --no-modify-path --profile minimal \
    --default-toolchain 1.100.0 --component rustfmt,clippy \
  && rm /tmp/rustup-init.sh \
  && cargo --version && cargo fmt --version && cargo clippy --version
