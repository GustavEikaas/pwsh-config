
<#
.SYNOPSIS
    gh pr create --draft --fill
#>
function ghprc{
  gh pr create --draft --fill
}


<#
.SYNOPSIS
    gh pr create --draft --fill
#>
function ghprc{
  gh pr merge --squash 
}

<#
.SYNOPSIS
    gh pr create --draft --fill
#>
function ghprc{
  gh pr checkout $args     
}

