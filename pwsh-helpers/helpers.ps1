function Get-FunctionHelp {
    param (
        [string]$FunctionName
    )

    $help = Get-Help -Name $FunctionName -ErrorAction SilentlyContinue
    if ($help) {
        [PSCustomObject]@{
            FunctionName = $FunctionName
            Synopsis = $help.Synopsis
        }
    }
}

function Get-DeclaredFunctions {
    param (
        [string]$ScriptPath
    )
    $scriptContent = Get-Content -Raw -Path $ScriptPath
    $ast = [System.Management.Automation.Language.Parser]::ParseInput($scriptContent, [ref]$null, [ref]$null)

    $functionInfo = foreach ($function in $ast.FindAll({$args[0] -is [System.Management.Automation.Language.FunctionDefinitionAst]}, $true)) {
        $functionName = $function.Name
        $helpInfo = Get-FunctionHelp -FunctionName $functionName
        if ($helpInfo) {
            $helpInfo
        }
    }

    foreach ($info in $functionInfo) {
        Write-Host "  $($info.FunctionName) - $($info.Synopsis)"
    }
}

function Get-FunctionsInFiles {
    param (
        [array]$Files
    )

    foreach ($file in $Files) {
        $displayName = $file.DisplayName
        Write-Host "`n[$displayName]"
        $functionNames = Get-DeclaredFunctions -ScriptPath $file.FileName
    }
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
