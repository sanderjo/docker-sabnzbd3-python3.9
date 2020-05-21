# Version: 0.0.2
FROM ubuntu:20.04

# Docker image with SABnzbd (git version) running on Python3.9

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

MAINTAINER Sander "superkoning@caiway.net"

RUN apt update -y && apt-get upgrade -y
RUN apt install sabnzbdplus git par2 rar python3-setuptools python3-pip -y

# python 3.9 stuff:
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install python3.9 -y

# stuff to install (compile!) sabyenc3 into python3.9
RUN apt install python3.9-distutils python3.9-dev libffi-dev libssl-dev -y
RUN python3.9 -m pip install sabyenc3 --upgrade --force-reinstall

RUN rm /usr/bin/python3
RUN ln -s /usr/bin/python3.9 /usr/bin/python3

RUN cd / && git clone https://github.com/sabnzbd/sabnzbd.git && \
	cd sabnzbd/ && \
	pip3 install -r requirements.txt -U && \
	tools/make_mo.py

# monkey patch feedparser
RUN sed -i 's/base64.decodestring/base64.decodebytes/g' /usr/lib/python3/dist-packages/feedparser.py

CMD env LANG=en_US.UTF-8 sabnzbd/SABnzbd.py -b0 --server 0.0.0.0:8080

RUN echo 'Hi, I am in your container'

# ports and volumes
EXPOSE 8080 9090
VOLUME /config /downloads /incomplete-downloads

