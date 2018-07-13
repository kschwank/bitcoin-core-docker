FROM ubuntu:rolling

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install software-properties-common && \
    apt-get -y install libssl1.0.0 && \
    add-apt-repository -y ppa:bitcoin/bitcoin && \
    apt-get -y update && \
    apt-get -y install bitcoin-qt && \
    apt-get -y install bitcoind

VOLUME /bitcoin

ENV DISPLAY=:0
ENV QT_GRAPHICSSYSTEM="native"

CMD ["/usr/bin/bitcoin-qt", "-datadir=/bitcoin"]

