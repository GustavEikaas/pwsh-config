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
  $mergeOutput = gh pr merge --squash 
  if($mergeOutput -match "GraphQL: Pull Request is still a draft"){
    $markReady = ask -Question "Pull Request still draft, mark as ready and merge? (Y to merge, N to cancel)"
    if($markReady){
      gh pr ready
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

function ask{
    param (
        [string]$Question
    )

    # Display the question
    Write-Host $Question -ForegroundColor Cyan

    # Prompt for user input
    $response = Read-Host "(Y/N)"

    # Convert the response to uppercase for case-insensitive comparison
    $response = $response.ToUpper()

    # Check if the response is valid
    if ($response -eq 'Y' -or $response -eq 'YES') {
        return $true
    }
    elseif ($response -eq 'N' -or $response -eq 'NO') {
        return $false
    }
    else {
        Write-Host "Invalid response. Please enter Y or N." -ForegroundColor Red
        # Recursively call the function to prompt again
        return (ask -Question $Question)
    }
}
