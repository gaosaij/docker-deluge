FROM ubuntu:trusty

RUN wget http://download.deluge-torrent.org/source/deluge-1.3.9.tar.gz
    tar -xvzf deluge-1.3.9
    cd deluge-1.3.9
    sudo python setup.py build
    sudo python setup.py install

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
