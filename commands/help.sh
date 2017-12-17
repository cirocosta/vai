#!/bin/bash

set -o errexit

description() {
  echo "Prints a command's help message"
}

main() {
  if [[ -z $1 ]]; then
    show_vai_help
    exit 0
  fi

  local script=${VAI_COMMANDS_DIR}/$1.sh
  bash ${script} help $@
}

help() {
  cat <<-EOF
  USAGE:
    $ vai help [command]

    If no command passed, shows vai's help.
EOF
}

show_vai_help() {
  cat <<-EOF
  USAGE:
    vai <command> [args]

EOF

  vai list
}

eval "$@"
