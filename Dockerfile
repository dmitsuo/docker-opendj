# Customized from https://github.com/ghchinoy/forgerock-docker
FROM davimss/docker-jdk7
MAINTAINER DaviMSS <davimss@gmail.com>

WORKDIR /opt

ENV INSTALLPROP opendj-install.properties
ENV OPENDJ_FILE OpenDJ-3.0.0.zip

COPY imp.ldif /opt/imp.ldif
COPY $INSTALLPROP /opt/$INSTALLPROP

USER root

RUN set -x \
    && yum -y update \
    && yum install -y wget unzip \
    && yum clean all \
    # && wget https://drive.google.com/uc?id=0BwTIjYz7ZtzmcGo1R0VveHc0dFU&export=download \
    # && wget https://github.com/OpenRock/OpenDJ/releases/download/3.0.0/$OPENDJ_FILE \
    && wget -O $OPENDJ_FILE https://www.dropbox.com/s/70s0pscffpvtz93/OpenDJ-3.0.0.zip?dl=1 \ 
    && unzip $OPENDJ_FILE \
    && rm -r $OPENDJ_FILE \
    && chown caos:caos -fR /opt

USER caos    

WORKDIR /opt/opendj

RUN ./setup --cli --propertiesFilePath /opt/$INSTALLPROP --acceptLicense --no-prompt

RUN ./bin/status

EXPOSE 4444 1389 1636

CMD ["/opt/opendj/bin/start-ds", "-N"]

# To build the image
#   docker build -t opendj .

# To run the container
#   docker run -d -p 1389:1389 -p 1636:1636 -p 4444:4444 --name opendj opendj