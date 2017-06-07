#!/bin/bash

for f in ~/.dotfiles/bash/*; do
  . "$f"
done

export PATH=$PATH:~/.dotfiles/bin
