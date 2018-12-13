FROM huaixiaoz/linux:latest

LABEL maintainer "hello@ifnot.cc"

ARG ROOT_PASSWORD
RUN useradd --shell /bin/bash --home-dir /dp --create-home --password dp dp && \
  echo "dp:$ROOT_PASSWORD" | chpasswd && \
  echo "root:$ROOT_PASSWORD" | chpasswd
