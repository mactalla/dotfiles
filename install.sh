#!/bin/bash
shopt -s extglob

# Install Oh My ZSH
[[ -e $HOME/.oh-my-zsh ]] ||
    git clone -c core.eol=lf -c core.autocrlf=false -c fsck.zeroPaddedFilemode=ignore -c fetch.fsck.zeroPaddedFilemode=ignore \
      -c receive.fsck.zeroPaddedFilemode=ignore --depth=1 --branch "master" "https://github.com/ohmyzsh/ohmyzsh" "$HOME/.oh-my-zsh"

for file in .!(git|*.swp|.|); do
  [[ -e ~/${file} ]] || (echo "Linking ${file}" && ln -s $(pwd)/${file} ~/${file})
done
