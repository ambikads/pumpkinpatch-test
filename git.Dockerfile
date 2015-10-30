FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y git

RUN mkdir /root/.ssh/

ADD id_rsa /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone --depth 1 --branch fm_master git@github.com:keyme/kiosk.git

WORKDIR /kiosk

RUN git remote add upstream git@github.com:keyme/kiosk.git

VOLUME ["/kiosk"]
