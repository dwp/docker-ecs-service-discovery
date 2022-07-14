FROM python:3.6-alpine

RUN apk add --update --no-cache curl && \
    pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org boto3

COPY entrypoint.sh /bin/entrypoint.sh

COPY src/discoverecs.py /bin/discoverecs.py

RUN mkdir -p /prometheus && \
    chmod 0755 /bin/entrypoint.sh /bin/discoverecs.py && \
    chown -R nobody:nogroup /prometheus

ENTRYPOINT [ "/bin/entrypoint.sh" ]
