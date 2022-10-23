#### deploy script for dot files

DOTDIR=$(dirname -- $(realpath -- "$0"))
SCRDIR="${DOTDIR}/scripts"

## setup bashrc
echo ". ${SCRDIR}/dotf_bashrc" >> ~/.bashrc

## setup i3wm
cat ${SCRDIR}/dotf_i3wm >> ~/.i3/config

## setup vimrc
ln -s ${SCRDIR}/.vimrc ~/.vimrc

## install software
awk '{print $1}' 2b_installed | sudo xargs pacman -Syu --noconfirm

## install from AUR
awk '{print $1}' 2b_installed_AUR | sudo xargs yay -Syu --noconfirm

## TODO: tmux.conf deploy

