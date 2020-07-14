FROM dwpdigital/python-boto-behave

ARG VERSION=1.2

RUN apk add --update --no-cache curl

COPY entrypoint.sh /bin/entrypoint.sh

RUN curl -k -LSs --output /tmp/ecs-service-discovery.tar.gz \
    https://github.com/signal-ai/prometheus-ecs-sd/archive/v${VERSION}.tar.gz && \
    tar -C /tmp --strip-components=1 -zoxf /tmp/ecs-service-discovery.tar.gz && \
    rm -f /tmp/ecs-service-discovery.tar.gz && \
    mv /tmp/discoverecs.py /bin/ && \
    mkdir -p /prometheus && \
    chmod 0755 /bin/entrypoint.sh /bin/discoverecs.py && \
    chown -R nobody:nogroup /prometheus

ENTRYPOINT [ "/bin/entrypoint.sh" ]
