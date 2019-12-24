FROM debian:10

WORKDIR /app

ADD https://github.com/trapexit/mergerfs/releases/download/2.28.3/mergerfs_2.28.3.debian-buster_amd64.deb mergerfs.deb
COPY entrypoint.sh entrypoint.sh

RUN apt-get update && \
    apt-get install -y fuse procps && \
    dpkg -i mergerfs.deb && \
    mkdir /disks && \
    chmod +x entrypoint.sh

VOLUME /merged

# use with erichough/nfs-server

ENTRYPOINT ["./entrypoint.sh"]
