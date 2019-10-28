FROM debian:latest

RUN apt-get update
RUN apt-get -y install build-essential git sudo

RUN git clone https://github.com/vlang/v.git /opt/v
RUN cd /opt/v && make && ./v -o v v.v && ./v symlink

RUN useradd -m -s /bin/bash build
USER build

ADD sudoers /etc/sudoers
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "bash", "/entrypoint.sh" ]