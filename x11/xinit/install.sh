#!/bin/sh -e

cd "$(dirname "$0")"
ln -sfv "$(pwd -P)"/xinitrc ~/.xinitrc
ln -sfv "$(pwd -P)"/xserverrc ~/.xserverrc
