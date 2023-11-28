# Image Args
ARG UBUNTU_VER

FROM ubuntu:${UBUNTU_VER}
LABEL maintainer="Edgar Y. Walker <eywalker@uw.edu>, Daniel Sitonic <sitonic@uw.edu>"

# Deal with pesky Python 3 encoding issue
ENV LANG C.UTF-8

# Prevent Debian/Ubuntu from asking questions
ENV DEBIAN_FRONTEND noninteractive

# Install essential Ubuntu packages
# and upgrade pip
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y software-properties-common \
    git \
    wget \
    vim \
    curl \
    zip \
    unzip \
    fish \
    python3-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
    numpy \
    scipy \ 
    scikit-learn \
    pandas \
    matplotlib \ 
    seaborn \
    jax \ 
    numpyro \
    pymc

WORKDIR /src