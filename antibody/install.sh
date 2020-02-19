#!/bin/sh -e

SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

if command -v brew > /dev/null 2>&1; then
  brew tap | grep -q 'getantibody/tap' || brew tap getantibody/tap
  brew install antibody
else
  curl -sL https://git.io/antibody | sudo sh -s -- -b /usr/local/bin
fi

antibody bundle < "${SCRIPT_DIR}/bundles.txt" > ${HOME}/.zsh_plugins.sh