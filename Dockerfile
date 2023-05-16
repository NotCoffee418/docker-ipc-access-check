# Dockerfile
FROM alpine

ARG USER_NAME
ARG USER_ID

RUN addgroup -g ${USER_ID} ${USER_NAME} && \
    adduser -D -u ${USER_ID} -G ${USER_NAME} ${USER_NAME}

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER ${USER_NAME}

ENTRYPOINT ["/entrypoint.sh"]
