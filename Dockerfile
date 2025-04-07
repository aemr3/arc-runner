FROM ghcr.io/actions/actions-runner:latest

USER root

RUN apt-get update && apt-get install -y \
  git curl \
  && rm -rf /var/lib/apt/lists/*

USER runner
