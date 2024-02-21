<#
.SYNOPSIS
    gh pr create --draft --fill
#>
function ghprc{
  gh pr create --draft --fill
  gh pr view
}

<#
.SYNOPSIS
    gh pr merge --squash
    gh pr view
    ggrm
#>
function ghprm {
  gh pr merge --squash -d 
  if(-not $?){
    $markReady = ask -Question "Pull Request still draft, mark as ready and merge? (Y to merge, N to cancel)"
    if($markReady){
      gh pr ready
      Start-Sleep -Seconds 5
    }else{
      Write-Host "Aborting..."
      return
    }
  }

  ghprm
  ghprv
  ggrm
}

<#
.SYNOPSIS
    gh pr checkout <branch|number>
#>
function ghprch{
  gh pr checkout $args     
}

<#
.SYNOPSIS
    gh pr diff
#>
function ghprd{
  gh pr diff $args     
}

<#
.SYNOPSIS
    gh pr view
#>
function ghprv{
  gh pr view $args     
}

