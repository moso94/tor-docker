FROM alpine:3.11

COPY ["entrypoint.sh", "/"]

RUN apk update
RUN apk add zstd-libs=1.4.4-r1
RUN apk add tor
RUN chmod +x /entrypoint.sh

RUN echo "Log notice stdout" >> /etc/torrc
RUN echo "SocksPort 0.0.0.0:9150" >> /etc/torrc
RUN echo "ControlPort 0.0.0.0:9151" >> /etc/torrc

EXPOSE 9150 9151

ENTRYPOINT ["/entrypoint.sh"]