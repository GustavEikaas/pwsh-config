. "$PSScriptRoot/pwsh-helpers/helpers.ps1"

$Files = @(
    [PSCustomObject]@{ FileName = "$PSScriptRoot\git.ps1"; DisplayName = "git" },
    [PSCustomObject]@{ FileName = "$PSScriptRoot\pnpm.ps1"; DisplayName = "pnpm" }
    [PSCustomObject]@{ FileName = "$PSScriptRoot\snippet.ps1"; DisplayName = "snippet" }
    [PSCustomObject]@{ FileName = "$PSScriptRoot\gh.ps1"; DisplayName = "Github" }
)


foreach ($file in $Files) {
  . $file.FileName
} 



function welcome {
  Write-Host "Welcome to pwsh-alias"
  Write-Host "Type pwsh-alias show <name> to show available commands"
}

function pwsh-alias {
    param (
        [switch]$h,
        [string]$show
    )
    if ($h.IsPresent) {
        Write-Host "Available commands:"
        Write-Host "  pwsh-alias -h : Display available commands"
        Write-Host "  pwsh-alias show : List all declared functions"
        Write-Host "  pwsh-alias show <displayname> : List functions from the specified displayname"
        return
    }
    if ($show) {
        $showValue = $args

        $filteredFiles = $Files | Where-Object { $_.DisplayName -eq $showValue }
        if ($filteredFiles.Count -eq 0) {
            Write-Host "Error: No matching displayname found. Available options:"
            foreach ($file in $Files) {
                Write-Host "  pwsh-alias show $($file.DisplayName)"
            }
            return
        }

        foreach ($file in $filteredFiles) {
            $displayName = $file.DisplayName
            $scriptPath = $file.FileName

            Write-Host "`n[$displayName]"
            $functionNames = Get-DeclaredFunctions -ScriptPath $scriptPath
        }
    }
    else {
      welcome
      Get-FunctionsInFiles -Files $Files
    }
}
