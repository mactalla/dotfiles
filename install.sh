#!/bin/bash

shopt -s extglob

for file in .!(git|*.swp|.|); do
  [[ -e ~/${file} ]] || (echo "Linking ${file}" && ln -s $(pwd)/${file} ~/${file})
done
