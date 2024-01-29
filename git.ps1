
# git pull alias
function ggp {
  git pull 
}

# git add alias
function gga {
  & git add $args
}

# git commit alias
function ggc {
  & git commit $args
}

# git status alias
function ggs {
  git status
}

# git reset hard 
function ggr {
  git reset --hard origin/main
  git clean -f -d
}

