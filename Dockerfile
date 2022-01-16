FROM ubuntu:20.04
LABEL Author="Walter Fan <walter.fan@gmail.com>"
LABEL Description="Docker image for NS-3 Network Simulator, changed from Ryan Kurte's image"

RUN apt-get update

# General dependencies
RUN apt-get install -y \
  git \
  mercurial \
  wget \
  vim \
  autoconf \
  bzr \
  cvs \
  unrar \
  build-essential \
  clang \
  valgrind \
  gsl-bin \
  libgsl23 \
  libgsl-dev \
  flex \
  bison \
  libfl-dev \
  tcpdump \
  sqlite \
  sqlite3 \
  libsqlite3-dev \
  libxml2 \
  libxml2-dev \
  vtun \
  lxc

# QT4 components
RUN apt-get install -y \
  qtbase5-dev

# Python components
RUN apt-get install -y \
  python \
  python-dev \
  python-setuptools \
  cmake \
  libc6-dev \
  libc6-dev-i386 \
  g++-multilib

# NS-3

# Create working directory
RUN mkdir -p /opt/ns3
WORKDIR /opt

# Fetch NS-3 source
RUN wget https://www.nsnam.org/releases/ns-allinone-3.35.tar.bz2 --no-check-certificate
RUN tar -xf ns-allinone-3.35.tar.bz2

# Configure and compile NS-3
RUN cd ns-allinone-3.35 && ./build.py --enable-examples --enable-tests

RUN ln -s /opt/ns-allinone-3.35/ns-3.35/ /opt/ns3/

# Fetch libevent

RUN wget https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
RUN tar xvfz libevent-2.1.12-stable.tar.gz
RUN cd libevent-2.1.12-stable && ./configure && make && make install

# Cleanup
RUN apt-get clean && \
  rm -rf /var/lib/apt && \
  rm /opt/ns-allinone-3.35.tar.bz2 && \
  rm /opt/libevent-2.1.12-stable.tar.gz



