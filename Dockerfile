FROM debian:latest

RUN apt-get update
RUN apt-get -y install build-essential git sudo

RUN chmod -R a+w /opt

ADD sudoers /etc/sudoers
ADD entrypoint.sh /entrypoint.sh

RUN useradd -m -s /bin/bash build
USER build

RUN git clone https://github.com/vlang/v.git /opt/v
RUN cd /opt/v && make && ./v -o v v.v && sudo ./v symlink

ENTRYPOINT [ "bash", "/entrypoint.sh" ]
