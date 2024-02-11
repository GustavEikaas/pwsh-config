$snipContent = @"
function main(){




}

main();
"@
$packageJsonContent = @"
{
  "name": "snippet",
  "version": "1.0.0",
  "private": true,
  "description": "Run some snippets",
  "main": "index.js",
  "scripts": {
    "start": "tsx snip.ts"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "tsx": "latest"
  }
}
"@


<#
.SYNOPSIS
    create or open snippet sandbox
#>
function snippet {
    [CmdletBinding()]
    param (
        [switch]$CleanRegenerate
    )
    $user = $env:USERNAME
    $snippetPath = "C:\Users\$user\repo\snippet"

    # Check if the snippet directory exists, if not, create it
    if (-not (Test-Path $snippetPath)) {
        New-Item -Path $snippetPath -ItemType Directory -Force
        $packageJsonPath = Join-Path -Path $snippetPath -ChildPath 'package.json'
        Set-Content -Path $packageJsonPath -Value $packageJsonContent
        tsc --init
        $snipPath = Join-Path -Path $snippetPath -ChildPath 'snip.ts'
        Set-Content -Path $snipPath -Value $snipContent
    }

  if ($CleanRegenerate -and (Test-Path (Join-Path -Path $snippetPath -ChildPath 'snip.ts'))) {
        Remove-Item -Path (Join-Path -Path $snippetPath -ChildPath 'snip.ts')
        $snipPath = Join-Path -Path $snippetPath -ChildPath 'snip.ts'
        Set-Content -Path $snipPath -Value $snipContent
    }

    # Set the location to the snippet directory
    Set-Location -Path $snippetPath
    pnpm i
    nvim snip.ts
}
