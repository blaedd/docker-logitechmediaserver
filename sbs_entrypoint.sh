#!/bin/sh

umask 0002
PUID=${PUID:-`id -u squeezeboxserver`}
PGID=${PGID:-`id -g nogroup`}
HTTP_PORT=${HTTP_PORT:-9000}
CLI_PORT=${CLI_PORT:-9090}

usermod -o -u "$PUID" squeezeboxserver
groupmod -o -g "$PGID" nogroup

chown -R ${PUID}:${PGID} /config
umask 0002
exec squeezeboxserver --httpport ${HTTP_PORT} --cliport ${CLI_PORT} "$@"
