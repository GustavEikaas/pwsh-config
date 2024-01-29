
# git pull alias
function gitp {
  git pull 
}

# git add alias
function gita {
  & git add $args
}

# git commit alias
function gitc {
  & git commit $args
}

function gits {
  git status
}

# git reset hard 
function gitr {
  git reset --hard origin/main
  git clean -f -d
}

