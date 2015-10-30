FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y python-dev python-pip python-yaml python-keyring
RUN pip install fabric
WORKDIR kiosk/setup/scripts

