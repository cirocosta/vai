#!/bin/bash

_vai () {
  local input completions
  local oldifs=$IFS

  COMPREPLY=()
  input="${COMP_WORDS[COMP_CWORD]}"
  IFS=$'\n'
  completions=$(vai _compl "$input")
  IFS=$oldifs

  COMPREPLY=( $(compgen -W "$completions" -- "$input") )
	if [[ ${#COMPREPLY[*]} -eq 1 ]]; then
    COMPREPLY=( ${COMPREPLY[0]%%:*} )
  fi
}

complete -F _vai vai

