#!/bin/bash

DATADIR=/home/realtime/analysis_data
BTSYNC_IMAGE=docker-realtime-btsync

docker.io kill inasafe-realtime-btsync
docker.io rm inasafe-realtime-btsync

mkdir -p $DATADIR
cp web/index.html ${DATADIR}/
cp -r web/resource ${DATADIR}/
# Uncomment to run with a bash prompt for testing
# You can start apache inside the container using
#
# btsync --config /btsync/btsync.conf --nodaemon

docker.io run --name="$BTSYNC_IMAGE" \
	-v $DATADIR:$DATADIR \
	-p 8888:8888 \
	-p 55555:55555 \
	--entrypoint=/bin/bash \
	-i -t AIFDR/${BTSYNC_IMAGE} -i

# Once testing is done comment the above and use
# this one rather.
#docker.io run --name="$BTSYNC_IMAGE" \
#	-v $WEBDIR:/var/www \
#	-p 8888:8888 \
#	-p 55555:55555 \
#	-d -t AIFDR/${BTSYNC_IMAGE}


