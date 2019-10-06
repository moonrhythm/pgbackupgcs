FROM postgres:alpine

RUN apk add --no-cache curl bash python && \
	curl https://sdk.cloud.google.com | bash && \
	rm -rf /root/.config && \
	mkdir /data

ADD backup.sh /
RUN chmod +x /backup.sh

WORKDIR /data

ENTRYPOINT ["/backup.sh"]
