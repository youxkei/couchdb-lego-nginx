ARG VERSION
FROM goacme/lego:${VERSION}

LABEL maintainer="youxkei@gmail.com"

RUN apk add --no-cache curl jq

COPY scripts /scripts
RUN chmod 755 /scripts/*.sh

RUN mkdir -p /lego

COPY crontab /var/spool/cron/crontabs/root
RUN chown -R root:root /var/spool/cron/crontabs/root && chmod -R 640 /var/spool/cron/crontabs/root

STOPSIGNAL SIGKILL

EXPOSE 80

ENTRYPOINT "/scripts/cron.sh"
