DOTFILES="$(cd $(dirname ${0}) && echo ${PWD})"

mkdir -p ~/.zshrc.d/
ln -s ${DOTFILES}/zshrc.d/docker ~/.zshrc.d/docker
ln -s ${DOTFILES}/zshrc.d/linuxbrew ~/.zshrc.d/linuxbrew
ln -s ${DOTFILES}/zshrc.d/prompt ~/.zshrc.d/prompt
ln -s ${DOTFILES}/zshrc.d/history ~/.zshrc.d/history

ln -s ${DOTFILES}/zshrc ~/.zshrc
ln -s ${DOTFILES}/gitconfig ~/.gitconfig
ln -s ${DOTFILES}/gitignore ~/.gitignore
ln -s ${DOTFILES}/tmux.conf ~/.tmux.conf
ln -s ${DOTFILES}/dir_colors ~/.dir_colors
