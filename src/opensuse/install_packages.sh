#!/bin/bash
#
# Description
#   Installs necessary packages.
#
# TODO
#   There are 4 categories: server, client, textmode, GUI.
#   It should be posible to select what category to install.
#
set -xe

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bash $DIR/import_unknown_keys.sh
bash $DIR/add_external_repos.sh
zypper --no-gpg-checks --gpg-auto-import-keys ref


# textmode
zypper in -y cowsay
zypper in -y docker
zypper in -y fortune
zypper in -y git
zypper in -y grc
zypper in -y mosh
zypper in -y php
zypper in -y python
zypper in -y python-pip && pip install --upgrade pip
zypper in -y qemu
zypper in -y openssh
zypper in -y sshfs
zypper in -y tmux
zypper in -y tree
zypper in -y vim
zypper in -y wget


# textmode server
zypper in -y znc


# GUI
zypper in -y code
zypper in -y google-chrome-stable
zypper in -y shutter
zypper in -y terminator

set +xe
