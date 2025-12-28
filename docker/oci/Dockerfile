FROM ghcr.io/opentofu/opentofu:minimal AS tofu

FROM python:3.14-slim AS base
RUN set -xe && apt update && apt install -y adduser sudo curl

FROM base AS builder
ARG USER_ID=1000
ARG GROUP_ID=1000
ARG USER_NAME=oci
ARG NODE_VERSION=24
COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu
RUN set -xe && \
    curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt update && apt install -y nodejs && \
    adduser --uid ${USER_ID} --home /home/${USER_NAME} ${USER_NAME} && \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME} && \
    mkdir -p /home/${USER_NAME}/.oci && \
    chown -R ${USER_NAME}:root /home/${USER_NAME} && \
    chmod -R 755 /home/${USER_NAME} && \
    pip install --break-system-packages oci oci-cli 

USER ${USER_NAME}
WORKDIR /app
ENTRYPOINT ["/bin/bash"]

