#!/bin/bash

for f in ~/.dotfiles/bash/*; do
  # shellcheck disable=SC1090
  . "$f"
done

export PATH=$PATH:~/.dotfiles/bin
