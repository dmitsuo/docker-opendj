FROM davimss/docker-jdk:7

WORKDIR /opt
ENV OPENDJ_FILE OpenDJ-3.0.0.zip

USER root

RUN set -x \
    && yum -y update \
    && yum install -y wget unzip \
    && yum clean all \
    && wget -O $OPENDJ_FILE https://www.dropbox.com/s/70s0pscffpvtz93/OpenDJ-3.0.0.zip?dl=1 \
    && unzip $OPENDJ_FILE \
    && rm -r $OPENDJ_FILE \
    && chown caos:caos -fR /opt

USER caos

WORKDIR /opt/opendj