#!/bin/bash

description() {
  echo "Prints a project's description"
}

main() {
  if [[ -z $1 ]]; then
    echo "Error: 'description' requires one argument."
    echo "Usage: description <command>"
    exit 1
  fi

  local script=${VAI_COMMANDS_DIR}/$1.sh
  bash ${script} description $@
}

help() {
  cat <<-EOF
  USAGE:
    $ vai help [cmd]

    Prints the description of a given command.
    The description is intended to be a short message
    (50char) that describes the main feature of a given
    command.
EOF
}

eval "$@"
