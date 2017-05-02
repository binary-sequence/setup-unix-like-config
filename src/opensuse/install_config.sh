#!/bin/bash
#
# Description
#   Installs the custom configuration.
#
# TODO
#   .profile
#


system_username=`whoami`
read -p "git username: " git_username
read -p "git email: " git_email

set -x
target_home_path="/home/$system_username"
target_root_path="$target_home_path/github/unix-like-config"
source_home_path='root/home/username'
source_bin_path='root/usr/local/bin'

if [ ! -d "$target_root_path" ]; then
  git clone https://github.com/binary-sequence/unix-like-config.git $target_root_path
fi
git checkout -b v0.1 tags/v0.1
ln -s -fT $target_root_path/$source_home_path/.colortail $target_home_path/.colortail
mkdir $target_home_path/.config/Code
ln -s -fT $target_root_path/$source_home_path/.config/Code/User $target_home_path/.config/Code/User
mkdir -p $target_home_path/.config/sublime-text-2/Packages
ln -s -fT $target_root_path/$source_home_path/.config/sublime-text-2/Packages/User $target_home_path/.config/sublime-text-2/Packages/User
ln -s -fT $target_root_path/$source_home_path/.config/terminator $target_home_path/.config/terminator
ln -s -fT $target_root_path/$source_home_path/.grc $target_home_path/.grc
ln -s -fT $target_root_path/$source_home_path/.bash_aliases $target_home_path/.alias
ln -s -fT $target_root_path/$source_home_path/.bashrc.color_prompt $target_home_path/.bashrc.color_prompt
echo "source $target_home_path/.bashrc.color_prompt" >> $target_home_path/.bashrc
ln -s -fT $target_root_path/$source_home_path/.gitconfig $target_home_path/.gitconfig
# ln -s -fT $target_root_path/$source_home_path/.profile $target_home_path/.profile
mkdir $target_home_path/.shutter
ln -s -fT $target_root_path/$source_home_path/.shutter/drawingtool.xml $target_home_path/.shutter/drawingtool.xml
ln -s -fT $target_root_path/$source_home_path/.shutter/settings.xml $target_home_path/.shutter/settings.xml
ln -s -fT $target_root_path/$source_home_path/.vimrc $target_home_path/.vimrc
ln -s -fT $target_root_path/$source_bin_path/openQA /usr/local/bin/openQA
ln -s -fT $target_root_path/$source_bin_path/diff-highlight /usr/local/bin/diff-highlight
ln -s -fT $target_root_path/$source_bin_path/git-sync-fork.sh /usr/local/bin/git-sync-fork.sh
ln -s -fT $target_root_path/$source_bin_path/notify-send-fortune.sh /usr/local/bin/notify-send-fortune.sh
ln -s -fT $target_root_path/$source_bin_path/resolve_filenames_broken_encoding.sh /usr/local/bin/resolve_filenames_broken_encoding.sh
ln -s -fT $target_root_path/$source_bin_path/showBatteryStatus.sh /usr/local/bin/showBatteryStatus.sh

sed -i -e "s/xyz@mail.de/$git_email/" $target_home_path/.gitconfig
sed -i -e "s/xyz/$git_username/" $target_home_path/.gitconfig

set +x

echo "You should now execute 'source ~/.alias'"
