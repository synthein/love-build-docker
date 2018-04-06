FROM ubuntu:16.04

# Install some helpful utilities for building things.
RUN apt-get update && apt-get -y install \
	binutils \
	curl \
	graphviz \
	lua5.1 \
	luarocks \
	make \
	snapcraft \
	xz-utils \
	zip
	
# Install some Lua modules.
RUN for package in \
		lunatest \
		lrandom \
		luasocket \
	; do luarocks install $package; done

# Install LÖVE itself.
RUN echo "deb http://ppa.launchpad.net/bartbes/love-stable/ubuntu xenial main" >> /etc/apt/sources.list \
	&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 61F881CBF3A87BDF74E398A4F192197F81992645 \
	&& apt-get update \
	&& apt-get -y install love
