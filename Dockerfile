FROM ubuntu:latest

LABEL org.opencontainers.image.source https://github.com/luizpra/devopsenv

RUN apt update
RUN apt install -y net-tools automake autoconf curl git make openssl unzip sipcalc jq gh wget

COPY bin/bw /usr/local/bin
RUN  chmod +x /usr/local/bin/bw

COPY bin/terraform /usr/local/bin
RUN  chmod +x /usr/local/bin/terraform

COPY install.sh .
RUN ./install.sh


ENTRYPOINT [ "sleep", "infinity" ]