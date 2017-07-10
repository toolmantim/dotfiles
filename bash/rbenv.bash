#!/bin/bash

# Prioritize ~/.rbenv before homebrew version

if [[ -d ~/.rbenv ]]; then
  eval "$(~/.rbenv/bin/rbenv init -)"
elif which rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi