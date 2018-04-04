FROM ubuntu:16.04

# Install some helpful utilities for building things.
RUN apt-get update && apt-get -y install \
	binutils \
	curl \
	graphviz \
	lua5.1 \
	make \
	snapcraft \
	xz-utils \
	zip

# Install LÖVE itself.
RUN echo "deb http://ppa.launchpad.net/bartbes/love-stable/ubuntu xenial main" >> /etc/apt/sources.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 61F881CBF3A87BDF74E398A4F192197F81992645 \
	&& apt-get update \
	&& apt-get -y install love
