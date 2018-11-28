FROM ubuntu:16.04

ARG LOVE_VERSION=11.2

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
RUN curl -LO https://bitbucket.org/rude/love/downloads/love-${LOVE_VERSION}-x86_64.AppImage \
	&& chmod +x love-${LOVE_VERSION}-x86_64.AppImage \
	&& ./love-${LOVE_VERSION}-x86_64.AppImage --appimage-extract \
	&& mv squashfs-root /opt/love \
	&& rm love-${LOVE_VERSION}-x86_64.AppImage

ADD love.sh /usr/local/bin/love
