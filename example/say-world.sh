#!/bin/bash

description () {
  echo 'Prints `world` to stdout.'
}

main () {
  echo "world!"
}

eval "$@"
