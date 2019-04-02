FROM jenkins/jenkins:lts
MAINTAINER Antonio Sapuppo <antoniosapuppo@yahoo.it>

USER root
RUN apt-get update && \
        apt-get install -y \
        build-essential \
        cmake \
        git \
        wget \
        unzip \
        libffi-dev \
        libncurses5-dev \
        libgdbm-dev \
        libnss3-dev \
        libssl-dev \
        libreadline-gplv2-dev \
        zlib1g

WORKDIR /workspace
RUN wget https://github.com/python/cpython/archive/v3.7.3.zip \
&& unzip v3.7.3.zip \
&& rm v3.7.3.zip

RUN cd cpython-3.7.3/ \
&& ./configure --enable-optimizations \
&& make \
&& make test \
&& make install
