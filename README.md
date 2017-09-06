# OpenDJ LDAP Server Docker image
OpenDJ LDAP Server Docker image

## To build the image
`docker build -t opendj .`

## To run the container
`docker run -d -p 1389:1389 -p 1636:1636 -p 4444:4444 --name opendj opendj`

## To customize the image
Change the `opendj-install.properties` and/or `imp.ldif` files.

## Credits
This Docker image was customized from https://github.com/ghchinoy/forgerock-docker
