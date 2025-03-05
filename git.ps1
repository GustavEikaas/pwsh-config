. "$PSScriptRoot/git-helpers/helpers.ps1"
<#
.SYNOPSIS
    git pull <args>
#>
function ggp
{
  git pull $args 
}

<#
.SYNOPSIS
    git reset --soft HEAD~
#>
function ggu
{
  git reset --soft HEAD~
  git restore --staged .
}

<#
.SYNOPSIS
    git add <args>
#>
function gga
{
  & git add $args
}

<#
.SYNOPSIS
    git commit <args>
#>
function ggc
{
  & git commit $args
}

<#
.SYNOPSIS
    git status <args>
#>
function ggs
{
  git status $args
}

<#
.SYNOPSIS
    git checkout <args>
#>
function ggch
{
  if ($args.Count -ge 1)
  {
    git checkout $args

  } else
  {
    git fetch --all
    $branches = git branch -r | ForEach-Object { $_ -replace "origin/", "" } | Where-Object { $_ -notlike "*HEAD*" }
    Write-Host "Select a remote branch:"
    for ($i = 0; $i -lt $branches.Count; $i++)
    {
      Write-Host "$($i+1). $($branches[$i])"
    }
    $selection = Read-Host "Enter the number of the branch you want to select"
    if ([int]$selection -ge 1 -and [int]$selection -le $branches.Count)
    {
      $selectedBranch = $branches[$selection - 1].Trim()
      git checkout $selectedBranch
    } else
    {
      Write-Host "Invalid selection. Please enter a valid number."
    }

  }
}

<#
.SYNOPSIS
    git reset --hard && git clean -fd
#>
function ggr
{
  git reset --hard
  git clean -f -d
  ggp
}

<#
.SYNOPSIS
    git restore --source=origin/main $args
#>
function ggrf
{
  param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$filePath,
    [string]$source = "origin/main"
  )

  git restore $filePath --source=$source
}
<#
.SYNOPSIS
    ggr && ggch main && ggp
#>
function ggrm
{
  ggr
  ggch main
  ggp
}
<#
.SYNOPSIS
    git push <args>
#>

function ggpush
{
  [CmdletBinding()]
  param ([switch]$F)
  if((main-check) -and (-not $F))
  {
    Write-Host "On main branch, use -F flag to bypass"
    return
  }
  git push $args
}

<#
.SYNOPSIS
    git add . && git commit -m <args>
#>
function ggac
{
  [CmdletBinding()]
  param($Text)
  ggs
  git add .
  git commit -m $Text
}

function ggd
{
  git diff
}

