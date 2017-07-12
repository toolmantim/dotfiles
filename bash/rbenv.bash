#!/bin/bash

# Prioritize ~/.rbenv before homebrew version

if [[ -e ~/.rbenv/bin/rbenv ]]; then
  eval "$(~/.rbenv/bin/rbenv init -)"
elif which rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi