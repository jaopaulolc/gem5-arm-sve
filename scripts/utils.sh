#!/usr/bin/env bash

SCONS=`which scons 2>/dev/null`
[[ -z "$SCONS" ]] && SCONS=`which scons-3 2>/dev/null`
if [[ -z "$SCONS" ]]; then
  echo "Failed to find scons/scons-3. Did you forget to install scons?"
  exit 1
fi

function check_env_var {
  local varname=$1

  if [[ -z "${!varname}" ]]; then
    echo "error: ${varname} not set. Did you forget to source setenv.sh?"
    exit 1
  fi
}
