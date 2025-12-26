FROM python:3.14-slim
ARG USER_ID=1000
ARG USER_NAME=oci
RUN set -xe && apt update && apt install -y adduser sudo && \
   adduser --uid ${USER_ID} --home /home/${USER_NAME} ${USER_NAME} && \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_NAME} && \
    mkdir -p /home/${USER_NAME}/.oci && \
    chown -R ${USER_NAME}:root /home/${USER_NAME} && \
    chmod -R 755 /home/${USER_NAME} && \
    pip install --break-system-packages uv oci oci-cli

USER ${USER_NAME}
WORKDIR /app
ENTRYPOINT ["/bin/bash"]
