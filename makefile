IMAGE_NAME = kschwank/bitcoin-core-qt
CONTAINER_NAME = bitcoin-qt-btc

XSOCK := /tmp/.X11-unix
XAUTH := /tmp/.docker-xauth

image:
	docker build --no-cache -t ${IMAGE_NAME} docker/

run:
	xauth nlist ${DISPLAY} | sed -e 's/^..../ffff/' | xauth -f ${XAUTH} nmerge -
	docker run -ti --rm -e "XAUTHORITY=${XAUTH}" -e "DISPLAY=${DISPLAY}" -v ${HOME}/.bitcoin-btc:/bitcoin -v ${XAUTH}:${XAUTH} -v ${XSOCK}:${XSOCK} --name=${CONTAINER_NAME} --user="${UID}:${GID}" ${IMAGE_NAME}

run-daemon:
	docker run -d --rm -v ${HOME}/.bitcoin-btc:/bitcoin --name=${CONTAINER_NAME} --user="${UID}:${GID}" ${IMAGE_NAME} /usr/bin/bitcoind -datadir=/bitcoin

clean:
	docker rm ${CONTAINER_NAME}

