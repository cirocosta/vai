#!/bin/bash

# Logging functions!
#
# 	lets you, who like colors, to print to the terminal in
#		a nice manner.
#
#		```/bin/bash
#
#		log::red "this will be in red!"
#
#		log::red " Header!
#		Multiline Text that will be entirely
#		in red and won't mess with your IFS!
#		"
#		```

if [[ $__SCRIPTS_LOG ]]; then return; fi
__SCRIPTS_LOG=1

readonly log_END="\e[0m"
readonly log_RED="\e[1;31m"
readonly log_GREEN="\e[1;32m"
readonly log_YELLOW="\e[1;33m"
readonly log_BLUE="\e[1;34m"
readonly log_GRAY="\e[1;37m"

log::red() {
  _log "${log_RED}" "$@"
}

log::green() {
  _log "${log_GREEN}" "$@"
}

log::yellow() {
  _log "${log_YELLOW}" "$@"
}

log::blue() {
  _log "${log_BLUE}" "$@"
}

log::gray() {
  _log "${log_GRAY}" "$@"
}

_log() {
  local tmp_IFS=$IFS
  IFS=$'\n'

  local color=$1
  shift
  printf "${color}%b${log_END}\n" $1
  shift

  while test $# -gt 0; do
    printf "${color}%b${log_END}" $1
    shift
  done

  IFS=$tmp_IFS
}
