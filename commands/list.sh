#!/bin/bash

set -o errexit

description() {
  echo "Lists available 'vai' commands"
}

main() {
  local cmd_scripts=$(find ${VAI_COMMANDS_DIR} -name "[^_]*.sh" -type f -print0 |
    xargs -0 basename -s .sh)

  echo "  COMMANDS:"
  for cmd in $cmd_scripts; do
    printf "    %-20s  %-50s\n" $cmd "$(vai description $cmd)"
  done
  echo
}

help() {
  cat <<-EOF
  USAGE:
    vai list

  'list' lists available commands to be executed
  from vai.
EOF
}

eval "$@"
