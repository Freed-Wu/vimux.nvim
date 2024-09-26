#!/usr/bin/env bash
set -e
cd "$(dirname "$(dirname "$(readlink -f "$0")")")"

case $OSTYPE in
  linux-*)
    ext=so
    ;;
  darwin*)
    ext=dynlib
    ;;
  *)
    ext=dll
    ;;
esac
touch .libs/vimux.so .libs/vimux.dylib .libs/vimux.dll
cp .libs/libvimux.$ext .libs/vimux.$ext
