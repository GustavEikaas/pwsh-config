
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


function ggpush {
  $filesChangedBefore = git diff --name-only origin/main..HEAD | Measure-Object | Select-Object -ExpandProperty Count
  $commitsAheadBefore = git rev-list --count HEAD ^origin/main

  git push $args

  Write-Host "Files changed: $filesChangedBefore, Commits ahead: $commitsAheadBefore"
}
