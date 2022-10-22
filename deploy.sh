#### deploy script for dot files

DOTDIR=`pwd`
SCRDIR='${DOTDIR}/scripts'

echo ". ${SCRDIR}/dotf_bashrc" >> ~/.bashrc

cat ${SCRDIR}/dotf_i3wm >> ~/.i3/config

## TODO: tmux.conf deploy
