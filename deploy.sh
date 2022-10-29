#### deploy script for dot files

DOTDIR=$(dirname -- $(realpath -- "$0"))
SCRDIR="${DOTDIR}/scripts"

## setup bashrc
echo ". ${SCRDIR}/dotf_bashrc" >> ~/.bashrc

## setup i3wm
echo "include ${SCRDIR}/dotf_i3wm" >> ~/.i3/config

## setup vimrc
ln -s ${SCRDIR}/.vimrc ~/.vimrc
## TODO: install all plugins here -> vundle

## install software
awk '{print $1}' 2b_installed | sudo xargs pacman -Syu --noconfirm

## install from AUR
awk '{print $1}' 2b_installed_AUR | sudo xargs yay -Syu --noconfirm

## tmux.conf deploy
mkdir -p ~/.config/tmux/tmux.conf
ln -s ${SCRDIR}/tmux.conf ~/.config/tmux/tmux.conf

