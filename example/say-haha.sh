#!/bin/bash

description () {
  echo 'Prints `haha` to stdout.'
}

main () {
  echo "haha"
}

eval "$@"
