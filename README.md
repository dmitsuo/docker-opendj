# OpenDJ LDAP Server Docker image
OpenDJ LDAP Server Docker image

## To build the image
`docker build -t [whatever-image-name] .`

## To run the container
`docker run -d -p 1389:1389 -p 1636:1636 -p 4444:4444 --name [whatever-container-name] [whatever-image-name]`

## To customize the image
Change the `opendj-install.properties` and/or `imp.ldif` files and rebuild the image.

## Credits
This Docker image was customized from https://github.com/ghchinoy/forgerock-docker
