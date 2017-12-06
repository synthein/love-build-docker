FROM ubuntu:16.04

# Install some helpful utilities for building things.
RUN apt-get update \
	&& apt-get -y install binutils curl lua5.1 xz-utils zip

# Install LÖVE itself.
RUN apt-get update && apt-get install -y software-properties-common \
	&& add-apt-repository ppa:bartbes/love-stable \
	&& apt-get update \
	&& apt-get -y install love
