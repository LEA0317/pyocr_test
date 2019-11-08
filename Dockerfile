FROM nvidia/cuda:10.1-devel-ubuntu18.04

MAINTAINER Toshihiro KONDA

RUN apt-get update && \
    apt install --yes vim \
		      python3 \
		      python3-pip \
		      build-essential \
		      tesseract-ocr-all

RUN pip3 install pyocr \
    	 	 pillow

ENV LANG C.UTF-8

ENV USER test
ENV HOME /home/${USER}
ENV SHELL /bin/bash

RUN useradd -m ${USER}
RUN gpasswd -a ${USER} sudo

USER ${USER}
WORKDIR ${HOME}

COPY pyocr.py .
COPY B.png .