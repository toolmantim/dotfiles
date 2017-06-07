#!/bin/bash

if [[ -d "/usr/local/opt/go" ]]; then
  export PATH="$PATH:/usr/local/opt/go/libexec/bin"
fi

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

mkdir -p "$GOPATH"