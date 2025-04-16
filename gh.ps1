. "$PSScriptRoot/git-helpers/helpers.ps1"
<#
.SYNOPSIS
    gh pr create --draft --fill
#>
function ghprc {
  gh pr create --draft --fill
  gh pr view
}

<#
.SYNOPSIS
    gh pr merge --squash && gh pr view ggrm
#>
function ghprm {
  gh pr merge --squash -d 
  if(-not $?){
    $markReady = ask -Question "Pull Request still draft, mark as ready and merge? (Y to merge, N to cancel)"
    if($markReady){
      gh pr ready
    }else{
      Write-Host "Aborting..."
      return
    }
  }
  gh pr merge --squash -d
  ghprv
  git checkout main
  git pull --quiet
}
<#
.SYNOPSIS
    git push && create draft pr if not remote
#>
function ghpush {
  [CmdletBinding()]
  param ([switch]$F)

  if((main-check) -and (-not $F)){
    Write-Host "On main branch, use -F flag to bypass"
    return
  }
  git push

  if(main-check){
    git log -n 5 --oneline
    return
  }

  gh pr view

  if (-not $?) {
    $createPr = ask -Question "No PR linked to branch, do you want to create a draft PR?"
    if($createPr){
      ghprc
    } 
  }

  git log -n 5 --oneline
}

<#
.SYNOPSIS
    gh pr checkout <branch|number>
#>
function ghprch {
  gh pr checkout $args     
}

<#
.SYNOPSIS
    gh pr diff
#>
function ghprd {
  gh pr diff $args     
}

<#
.SYNOPSIS
    gh pr view
#>
function ghprv{
  gh pr view $args     
}

<#
.SYNOPSIS
    gh pr view
#>
function ghrv{
  gh repo view --web
}

function ghprac {
  $branch = git rev-parse --abbrev-ref HEAD
  if ($branch -match '^(main|master|dev)$') {
      Write-Host "You are on a protected branch ($branch). Switch to a feature branch before proceeding."
      return
  }

  git add .
  git commit -m $args
  if (-not $?) {
      Write-Host "Commit failed. Aborting..."
      return
  }

  git push
  if (-not $?) {
      Write-Host "Push failed. Aborting..."
      return
  }

  gh pr create --fill
  gh pr view
}

