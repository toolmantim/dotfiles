#!/bin/bash

if [[ -d "/Applications/Postgres.app" ]]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi
