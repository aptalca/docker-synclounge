FROM lsiobase/alpine:3.10

# set version label
ARG BUILD_DATE
ARG SYNCLOUNGE_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="alex-phillips"

# environment settings
ENV HOME="/app"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache \
    nodejs \
    npm && \
 apk add --no-cache --virtual=build-dependencies \
    curl \
    git && \
 echo "**** install SyncLounge ****" && \
 git clone https://github.com/samcm/synclounge /app/synclounge && \
 cd /app/synclounge && \
 npm install && \
 npm run build && \
 echo "**** cleanup ****" && \
 apk del --purge \
    build-dependencies && \
 rm -rf \
    /root/.cache \
    /tmp/*

# copy local files
COPY root/ /
