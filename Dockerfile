FROM hypriot/rpi-alpine-scratch:latest

MAINTAINER Björn Kjeholt <dev@kjeholt.se>

RUN mkdir -p /var/lib/mysql

VOLUME ["/var/lib/mysql"]
