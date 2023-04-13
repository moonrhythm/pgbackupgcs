FROM postgres:bullseye

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		ca-certificates \
		curl \
		python3 \
	&& rm -rf /var/lib/apt/lists/* \
	&& curl https://sdk.cloud.google.com > install.sh \
	&& bash install.sh --disable-prompts \
	&& rm -rf /root/.config \
	&& mkdir /data

ADD backup.sh /
RUN chmod +x /backup.sh

WORKDIR /data

ENTRYPOINT ["/backup.sh"]
