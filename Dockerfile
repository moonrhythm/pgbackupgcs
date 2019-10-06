FROM postgres:alpine

RUN apk add curl python && \
	curl -O https://storage.googleapis.com/pub/gsutil.tar.gz && \
	tar zxf gsutil.tar.gz && \
	mkdir /data

ADD backup.sh /

WORKDIR /data

ENTRYPOINT ["/backup.sh"]
