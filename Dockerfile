# Version: 0.0.3
FROM ubuntu:20.04

# Docker image with SABnzbd3 (git version) running on Python3.9

ENV DEBIAN_FRONTEND noninteractive
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

MAINTAINER Sander "superkoning@caiway.net"

RUN apt update -y && apt-get upgrade -y
RUN apt install python3-pip git rar par2 software-properties-common libffi-dev libssl-dev -y

# python3.9:
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install python3.9 python3.9-distutils python3.9-dev -y
RUN rm /usr/bin/python3 && ln -s /usr/bin/python3.9 /usr/bin/python3

# SABnzbd from git
RUN cd / && git clone https://github.com/sabnzbd/sabnzbd.git && \
	cd sabnzbd/ && \
	python3 -m pip install -r requirements.txt -U && \
	tools/make_mo.py

# monkey patch feedparser
RUN for f in `find / -name 'feedparser.py' | grep dist` ; do sed -i 's/base64.decodestring/base64.decodebytes/g' $f ; done


CMD env LANG=en_US.UTF-8 /sabnzbd/SABnzbd.py -b0 --server 0.0.0.0:8080

RUN echo 'Hi, I am in your container'

# ports and volumes
EXPOSE 8080 9090
VOLUME /config /downloads /incomplete-downloads

