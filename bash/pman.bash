#!/bin/bash

pman () {
  man -t "${1}" | open -f -a /Applications/Preview.app
}
