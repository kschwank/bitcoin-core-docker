FROM ubuntu:rolling

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install software-properties-common && \
    add-apt-repository -y ppa:bitcoin/bitcoin && \
    apt-get -y update && \
    apt-get -y install bitcoin-qt

RUN export uid=1000 gid=1000 && \
    apt-get -y install sudo && \
    mkdir -p /home/user && \
    echo "user:x:${uid}:${gid}:User,,,:/home/user:/bin/bash" >> /etc/passwd && \
    echo "user:x:${uid}:" >> /etc/group && \
    echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user && \
    chown ${uid}:${gid} -R /home/user

VOLUME /bitcoin

USER user

ENV HOME="/home/user"
ENV DISPLAY=:0
ENV QT_GRAPHICSSYSTEM="native"

CMD ["/usr/bin/bitcoin-qt", "-datadir=/bitcoin"]

