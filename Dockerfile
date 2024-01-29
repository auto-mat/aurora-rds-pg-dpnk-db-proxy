FROM alpine:3.19

LABEL authors="Auto*Mat, z. s. auto-mat@auto-mat.cz"
LABEL maintainer="Auto*Mat, z. s. auto-mat@auto-mat.cz"

ENV LOCAL_BIN=/usr/local/bin
RUN apk add --update --no-cache autossh

COPY ./run.sh ${LOCAL_BIN}

RUN chmod +x ${LOCAL_BIN}/run.sh;

# Set user and group
ARG user=appuser
ARG group=appuser
ARG uid=1000
ARG gid=1000
RUN addgroup -g ${gid} ${group}
RUN adduser -D -u ${uid} -G ${group} -s /bin/sh ${user}

# Switch to user
USER ${uid}:${gid}

ENTRYPOINT ["run.sh"]
