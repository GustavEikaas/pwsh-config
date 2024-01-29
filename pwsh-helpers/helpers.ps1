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

