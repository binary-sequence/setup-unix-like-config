#!/bin/bash
#
# Description
#   Installs necessary packages.
#
# TODO
#   There are 4 categories: server, client, textmode, GUI.
#   It should be posible to select what category to install.
#
set -x


zypper ref


# textmode
zypper in -y cowsay
zypper in -y fortune
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


# GUI
zypper in -y shutter
zypper in -y terminator
# vscode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'
zypper --gpg-auto-import-keys ref
zypper in -y code
# google chrome
zypper ar http://dl.google.com/linux/chrome/rpm/stable/x86_64 google-chrome
zypper ref
zypper in -y google-chrome-stable

set +x
