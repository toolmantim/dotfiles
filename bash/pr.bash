#!/bin/bash

pr () {
  local branch=`git name-rev --name-only HEAD`
  local branch_origin=`git config --get "branch.${branch}.remote"`
  local repo=`git remote get-url ${branch_origin} | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  echo "... creating pull request for branch \"$branch\" in \"$repo\""
  open https://github.com/$repo/pull/new/$branch
}
