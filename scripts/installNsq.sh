#!/usr/bin/env bash
set -e

# check the platform
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='darwin'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
fi

NSQ_RELEASE=nsq-0.3.8.$platform-amd64.go1.6.2
NSQ_DOWNLOAD=http://bitly-downloads.s3.amazonaws.com/nsq/$NSQ_RELEASE.tar.gz

if [ ! -d "$NSQ_RELEASE" ]; then
  echo "download nsq from $NSQ_DOWNLOAD"
  wget $NSQ_DOWNLOAD
  tar zxvf $NSQ_RELEASE.tar.gz
fi

# test the binary
./$NSQ_RELEASE/bin/nsqd -version
