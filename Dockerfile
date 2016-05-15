FROM ubuntu:16.04
RUN apt update && apt install -y git wget curl libcurl4-openssl-dev build-essential 
RUN apt update && apt install -y sudo
RUN mkdir /tmp/massive
COPY . /tmp/massive
WORKDIR /tmp/massive

