#!/bin/bash

description () {
  echo 'Prints `hello` to stdout.'
}

main () {
  echo "hello!"
}

eval "$@"
