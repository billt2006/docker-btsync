#!/bin/bash

DATADIR=/home/realtime/analysis_data
BTSYNC_IMAGE=docker-realtime-btsync

docker.io kill ${BTSYNC_IMAGE}
docker.io rm ${BTSYNC_IMAGE}

mkdir -p ${DATADIR}
# Uncomment to run with a bash prompt for testing
# You can start apache inside the container using
#
# btsync --config /btsync/btsync.conf --nodaemon

#	-v $DATADIR:$DATADIR \
set -x
docker.io run --name="${BTSYNC_IMAGE}" \
	-p 8888:8888 \
	-p 55555:55555 \
	--entrypoint=/bin/bash \
	-i -t AIFDR/${BTSYNC_IMAGE} -i

# Once testing is done comment the above and use
# this one rather.
#docker.io run --name="${BTSYNC_IMAGE}" \
#	-v $WEBDIR:/var/www \
#	-p 8888:8888 \
#	-p 55555:55555 \
#	-d -t AIFDR/${BTSYNC_IMAGE}


