#!/bin/sh -e

CONFIG_DIR=~/.config/alacritty

[ -d "${CONFIG_DIR}" ] || mkdir -p "${CONFIG_DIR}"

cd "$(dirname "$0")"
ln -svf "$(readlink -ev alacritty.yml)" "${CONFIG_DIR}"

