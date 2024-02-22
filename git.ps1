
<#
.SYNOPSIS
    git pull <args>
#>
function ggp {
  git pull $args 
}

<#
.SYNOPSIS
    git add <args>
#>
function gga {
  & git add $args
}

<#
.SYNOPSIS
    git commit <args>
#>
function ggc {
  & git commit $args
}

<#
.SYNOPSIS
    git status <args>
#>
function ggs {
  git status $args
}

<#
.SYNOPSIS
    git checkout <args>
#>
function ggch {
  git checkout $args
}

<#
.SYNOPSIS
    git reset --hard && git clean -fd
#>
function ggr {
  git reset --hard
  git clean -f -d
  ggp
}

<#
.SYNOPSIS
    ggr && ggch main && ggp
#>
function ggrm {
  ggr
  ggch main
  ggp
}
<#
.SYNOPSIS
    git push <args>
#>

function ggpush {
  if(main-check){
    return
  }
  git push $args
}

<#
.SYNOPSIS
    git add . && git commit -m <args>
#>
function ggac {
   param(
        $Text
    )
  ggs
  git add .
  git commit -m $Text
}

