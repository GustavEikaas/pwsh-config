
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
    git push $args

    Write-Host "Files changed: $filesChangedBefore, Commits pushed: $commitsAheadBefore"
}

function ggh {
    Write-Host "Available Git Helper Commands:"
    Write-Host "  ggp     - Git Pull: Pull changes from the remote repository."
    Write-Host "  gga     - Git Add: Add changes to the staging area."
    Write-Host "  ggc     - Git Commit: Commit changes with a custom message."
    Write-Host "  ggs     - Git Status: Show the status of the working directory."
    Write-Host "  ggch    - Git Checkout: Switch to a different branch or commit."
    Write-Host "  ggr     - Git Reset Hard: Reset to the latest commit on the remote main branch."
    Write-Host "  ggrmain - Git Reset Hard Main: Reset to the latest commit on the remote main branch, checkout main, and pull changes."
    Write-Host "  ggpush  - Git Push: Push changes to the remote repository with information about files changed and commits pushed."
}

