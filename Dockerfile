FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y python-dev
RUN apt-get install -y python-pip
RUN apt-get install -y python-yaml
RUN apt-get install -y python-keyring
RUN apt-get install -y git
RUN pip install fabric

RUN mkdir /root/.ssh/

ADD id_rsa /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN git clone git@github.com:ambikads/kiosk.git
