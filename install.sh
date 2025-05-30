#!/bin/bash
shopt -s extglob

# Install Oh My ZSH
[[ -e $HOME/.oh-my-zsh ]] ||
    git clone -c core.eol=lf -c core.autocrlf=false -c fsck.zeroPaddedFilemode=ignore -c fetch.fsck.zeroPaddedFilemode=ignore \
      -c receive.fsck.zeroPaddedFilemode=ignore --depth=1 --branch "master" "https://github.com/ohmyzsh/ohmyzsh" "$HOME/.oh-my-zsh"

for file in .!(git|bin|*.swp|.|); do
  [[ -e ~/${file} ]] || (echo "Linking ${file}" && ln -s $(pwd)/${file} ~/${file})
done

mkdir -p ~/bin
for file in bin/*; do
  [[ -e ~/${file} ]] || (echo "Linking ${file}" && ln -s $(pwd)/${file} ~/bin/${file#*/})
done

mkdir -p ~/.config/karabiner
for file in config/karabiner/*; do
  [[ -e ~/.${file} ]] || (echo "Linking ${file}" && ln -s $(pwd)/${file} ~/.${file})
done

# FIXME: defaults write -g ApplePressAndHoldEnabled -bool false

# Install Nerd Fonts
function install_font() {
    fc-list | ag "${1}.*Nerd Font.*ttf" > /dev/null && return 0
    echo "Installing ${1} Nerd Font"
    [[ -d ~/nerd-fonts ]] || git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/nerd-fonts
    sudo ~/nerd-fonts/install.sh -S "${1}"
}
install_font Hack
