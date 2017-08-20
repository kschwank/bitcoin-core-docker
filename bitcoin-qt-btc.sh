#!/bin/bash
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker-xauth
xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f ${XAUTH} nmerge -
docker run -ti --rm -e "XAUTHORITY=${XAUTH}" -v ${HOME}/.bitcoin-btc:/bitcoin -v ${XAUTH}:${XAUTH} -v ${XSOCK}:${XSOCK} --name="bitcoin-qt-btc" kschwank/bitcoin-core-qt

