#! /bin/sh

if [ -z $@ ]; then
  echo "Use one of the following commands:"
  ls cmd
  exit 1
fi

./cmd/$@
