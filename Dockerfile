FROM ghcr.io/actions/actions-runner:latest

RUN sudo apt-get update && sudo apt-get install -y \
  git curl \
  && sudo rm -rf /var/lib/apt/lists/*
