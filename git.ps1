
<#
.SYNOPSIS
    git pull <args>
#>
function ggp {
  param ([switch]$h)
  if ($h.IsPresent) {
    Write-Host "git pull <args>"
    return
  }

  git pull $args 
}
#
# # git add alias
# function gga {
#   & git add $args
# }
#
# # git commit alias
# function ggc {
#   & git commit $args
# }
#
# # git status alias
# function ggs {
#   git status $args
# }
#
# function ggch {
#   git checkout $args
# }
#
# # git reset hard 
# function ggr {
#   git reset --hard
#   git clean -f -d
# }
#
# function ggrmain {
#   ggr
#   ggch main
#   ggp
# }
#
# function ggpush {
#     git push $args
# }
#
# function ggac {
#    param(
#         $Text
#     )
#   git add .
#   git commit -m $Text
# }
#
#
# function ggh {
#     Write-Host "Available Git Helper Commands:"
#     Write-Host "  ggp     - git pull <args?>"
#     Write-Host "  gga     - git add <args>"
#     Write-Host "  ggac    - git add && git commit -m <args>"
#     Write-Host "  ggc     - git commit <args>"
#     Write-Host "  ggs     - git status <args?>"
#     Write-Host "  ggch    - git checkout <args>"
#     Write-Host "  ggr     - git reset --hard && git clean -f -d"
#     Write-Host "  ggrmain - ggr && ggch main" 
#     Write-Host "  ggpush  - git push <args>"
# }
#
