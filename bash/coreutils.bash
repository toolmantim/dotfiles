#!/bin/bash

if [[ -d "/usr/local/opt/coreutils/libexec/gnubin" ]]; then
  # GNU CoreUtils (like sha256sum)
  export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
fi
