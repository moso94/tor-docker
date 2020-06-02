FROM alpine:3.11

COPY ["entrypoint.sh", "/"]

RUN addgroup -g 1000 tor && adduser -u 1000 -D -G tor tor && \
    apk update && \
    apk add --no-cache zstd-libs=1.4.4-r1 tor && \
    rm -rf /var/cache/apk/* && \
    chown tor:tor /entrypoint.sh && \
    chmod +x /entrypoint.sh && \
    mkdir -p /home/tor/.tor && \
    chown tor:tor -R /home/tor/.tor && \
    chmod 2700 /home/tor/.tor && \
    echo "Log notice stdout" >> /etc/torrc && \
    echo "SocksPort 0.0.0.0:9150" >> /etc/torrc && \
    echo "ControlPort 0.0.0.0:9151" >> /etc/torrc &&\
    echo "HashedControlPassword $(su - tor -s/bin/sh -c "tor --hash-password '00137300'")" >>/etc/torrc

USER tor

EXPOSE 9150 9151

ENTRYPOINT ["/entrypoint.sh"]