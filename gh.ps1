
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
#>
function ghprm{
  gh pr merge --squash 
}

<#
.SYNOPSIS
    gh pr checkout <branch|number>
#>
function ghprch{
  gh pr checkout $args     
}

