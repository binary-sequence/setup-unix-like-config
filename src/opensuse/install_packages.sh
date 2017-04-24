#!/bin/bash
#
# Description
#   Installs necessary packages.
#
# TODO
#   There are 4 categories: server, client, textmode, GUI.
#   It should be posible to select what category to install.


zypper ref


# textmode
zypper in -y git
zypper in -y grc
zypper in -y mosh
zypper in -y qemu
zypper in -y ssh
zypper in -y sshfs
zypper in -y tmux
zypper in -y tree
zypper in -y vim


# textmode server
zypper in -y znc
