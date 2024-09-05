FROM alpine

COPY ./run.sh /run.sh
RUN wget 'https://github.com/minio/certgen/releases/latest/download/certgen-linux-amd64' -O '/usr/local/bin/certgen' && \
    chmod a+x '/usr/local/bin/certgen' '/run.sh'


CMD ["/run.sh"]
