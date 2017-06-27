FROM alpine:3.6

# Build tools
RUN \
  apk --no-cache add --virtual .build_deps \
  autoconf \
  automake \
  build-base \
  glib \
  glib-dev \
  libc-dev \
  libtool \
  linux-headers \
  openssl \
  bash && \
# Build csvquote
  cd /tmp && \
  wget "https://github.com/dbro/csvquote/archive/master.zip" && \
  unzip master.zip && rm master.zip && \
  cd csvquote-master && \
  make && make install && \
#clean up
  apk del .build_deps \
  build-base \
  autoconf \
  automake \
  build-base \
  glib \
  glib-dev \
  libc-dev \
  libtool \
  linux-headers \
  openssl && \
  rm -rf /tmp/*

# Make the csvquote default command 
ENTRYPOINT ["/usr/local/bin/csvquote"]
