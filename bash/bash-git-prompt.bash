#!/bin/bash

if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  export GIT_PROMPT_FETCH_REMOTE_STATUS=0
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi