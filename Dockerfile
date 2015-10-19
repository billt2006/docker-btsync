# BitTorrent Sync
# VERSION 0.2

FROM ubuntu:14.04

MAINTAINER Bill Thornton <billt2006@gmail.com>

# Download and extract the executable to /usr/bin
ADD https://download-cdn.getsync.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz /usr/bin/btsync.tar.gz
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync/btsync.conf", "--nodaemon"]
