FROM nvidia/cuda:10.1-devel-ubuntu18.04

MAINTAINER Toshihiro KONDA

RUN apt-get update && \
    apt-get install --yes vim \
	    	          python3 \
		          python3-pip \
		          build-essential \
		          tesseract-ocr-all

RUN python3 -m pip install pyocr \
    	 	           pillow

ENV LANG C.UTF-8

ENV USER test
ENV HOME /home/${USER}
ENV SHELL /bin/bash

RUN useradd -m ${USER}
RUN gpasswd -a ${USER} sudo

USER ${USER}
WORKDIR ${HOME}

COPY pyocr_test.py .
COPY B.png .