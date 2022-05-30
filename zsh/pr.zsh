pr () {
  local branch=`git rev-parse --abbrev-ref HEAD`
  local branch_origin=`git config --get "branch.${branch}.remote"`
  local repo=`git remote get-url ${branch_origin} | sed -e "s/.*github.com[:/]\(.*\)\.git.*/\1/"`
  open https://github.com/$repo/pull/new/$branch
}
