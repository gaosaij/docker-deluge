FROM ubuntu:trusty

RUN apt-get -y install curl
RUN cd /tmp && curl -L 'http://download.deluge-torrent.org/source/deluge-1.3.9.tar.gz' | tar -xz
RUN cd /tmp/deluge-1.3.9
RUN sudo python setup.py build
RUN sudo python setup.py install

ADD start.sh /start.sh

VOLUME ["/data"]
# Torrent port
EXPOSE 53160
EXPOSE 53160/udp
# WebUI
EXPOSE 8112
# Daemon
EXPOSE 58846

CMD ["/start.sh"]
