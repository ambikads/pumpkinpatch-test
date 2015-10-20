FROM ubuntu:14.04

RUN apt-get update

RUN apt-get install -y git
CMD pip install fabric
RUN fab

RUN mkdir /root/.ssh/

ADD id_rsa /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN mkdir repo

RUN cd repo

RUN git clone git@github.com:ambikads/kiosk.git

RUN cd kiosk/setup/scripts

RUN fab
