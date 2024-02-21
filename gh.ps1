<#
.SYNOPSIS
    gh pr create --draft --fill
#>
function ghprc{
  gh pr create --draft --fill
}

<#
.SYNOPSIS
    gh pr merge --squash
    gh pr view
    ggrm
#>
function ghprm{
  gh pr merge --squash 
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
