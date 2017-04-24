#!/bin/bash
#
# Description
#   Installs the custom configuration.
#
# TODO
#   .bashrc and .profile
#
set -e

read -p "git username: " git_username
read -p "git email: " git_email

root_path='/home/user/github/unix-like-config'
home_path='root/home/username'
bin_path='root/usr/local/bin'

set -x
git clone https://github.com/binary-sequence/unix-like-config.git $root_path
ln -s -fT $root_path/$home_path/.colortail /home/user/.colortail
mkdir /home/user/.config/Code
ln -s -fT $root_path/$home_path/.config/Code/User /home/user/.config/Code/User
mkdir -p /home/user/.config/sublime-text-2/Packages
ln -s -fT $root_path/$home_path/.config/sublime-text-2/Packages/User /home/user/.config/sublime-text-2/Packages/User
ln -s -fT $root_path/$home_path/.config/terminator /home/user/.config/terminator
ln -s -fT $root_path/$home_path/.grc /home/user/.grc
ln -s -fT $root_path/$home_path/.bash_aliases /home/user/.alias
# ln -s -fT $root_path/$home_path/.bashrc /home/user/.bashrc
ln -s -fT $root_path/$home_path/.gitconfig /home/user/.gitconfig
# ln -s -fT $root_path/$home_path/.profile /home/user/.profile
ln -s -fT $root_path/$home_path/.vimrc /home/user/.vimrc
ln -s -fT $root_path/$bin_path/openQA /usr/local/bin/openQA
ln -s -fT $root_path/$bin_path/diff-highlight /usr/local/bin/diff-highlight
ln -s -fT $root_path/$bin_path/git-sync-fork.sh /usr/local/bin/git-sync-fork.sh
ln -s -fT $root_path/$bin_path/notify-send-fortune.sh /usr/local/bin/notify-send-fortune.sh
ln -s -fT $root_path/$bin_path/resolve_filenames_broken_encoding.sh /usr/local/bin/resolve_filenames_broken_encoding.sh
ln -s -fT $root_path/$bin_path/showBatteryStatus.sh /usr/local/bin/showBatteryStatus.sh

source /home/user/.alias

sed -i -e "s/xyz@mail.de/$git_email/" /home/user/.gitconfig
sed -i -e "s/xyz/$git_username/" /home/user/.gitconfig
