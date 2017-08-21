FROM ubuntu:rolling

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:bitcoin/bitcoin && \
    apt-get -y update && \
    apt-get -y install bitcoin-qt

VOLUME /bitcoin

ENV DISPLAY=:0
ENV QT_GRAPHICSSYSTEM="native"

CMD ["/usr/bin/bitcoin-qt", "-datadir=/bitcoin"]

