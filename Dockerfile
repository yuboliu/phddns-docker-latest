FROM ubuntu:latest

ENV TZ Asia/Shanghai
ENV DEBIAN_FRONTEND noninteractive

RUN set -ex \
    && echo $TZ > /etc/timezone \
    && apt-get update \
    && apt-get install -y --no-install-recommends tzdata wget net-tools\
    && rm /etc/localtime \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && dpkg-reconfigure -f noninteractive tzdata \
    && wget https://down.oray.com/hsk/linux/phddns_5.2.0_amd64.deb -O phddns_amd64.deb --no-check-certificate \
    && dpkg -i phddns_amd64.deb \
    && rm phddns_amd64.deb \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get autoremove -y

COPY run.sh health.sh /
HEALTHCHECK --interval=5s --timeout=5s --retries=3 --start-period=15s CMD ./health.sh
CMD ["sh", "/run.sh"]
