FROM docker.m.daocloud.io/library/ubuntu:22.04

WORKDIR /book
COPY docs  /book/docs
COPY custom  /book/custom
COPY asouldocs  /usr/bin/
RUN chmod 755  /usr/bin/asouldocs

EXPOSE 5555
SHELL ["/bin/sh"]
ENTRYPOINT ["/usr/bin/asouldocs","web"]
