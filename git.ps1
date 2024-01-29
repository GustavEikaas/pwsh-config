
# git pull alias
function ggp {
  git pull $args 
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
  git status $args
}

function ggch {
  git checkout $args
}

# git reset hard 
function ggr {
  git reset --hard origin/main
  git clean -f -d
}

function ggrmain {
  ggr
  ggch main
  ggp
}

function ggpush {
    $currentBranch = git rev-parse --abbrev-ref HEAD

    $filesChangedBefore = git diff --name-only $currentBranch..HEAD | Measure-Object | Select-Object -ExpandProperty Count
    $commitsAheadBefore = git rev-list --count HEAD ^$currentBranch

    git push $args

    Write-Host "Files changed: $filesChangedBefore, Commits pushed: $commitsAheadBefore"
} 
