FROM alpine

ARG NONROOT_USER=user
ARG NONROOT_USER_ID=5280

RUN apk add \
  bind-tools \
  busybox-extras \
  curl \
  git \
  iputils \
  netcat-openbsd \
  openssl

RUN addgroup --system ${NONROOT_USER} && \
    adduser -S -u ${NONROOT_USER_ID} ${NONROOT_USER} ${NONROOT_USER}

USER ${NONROOT_USER_ID}
ENTRYPOINT ["tail", "-f", "/dev/null"]
