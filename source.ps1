. "$PSScriptRoot/pwsh-helpers/helpers.ps1"

$Files = @(
    [PSCustomObject]@{ FileName = "$PSScriptRoot\git.ps1"; DisplayName = "git" },
    [PSCustomObject]@{ FileName = "$PSScriptRoot\pnpm.ps1"; DisplayName = "pnpm" }
)


foreach ($file in $Files) {
  . $file.FileName
} 


Get-FunctionsInFiles -Files $Files


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
      Get-FunctionsInFiles -Files $Files
    }
}
