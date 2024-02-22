function main-check{
$currentBranch = git rev-parse --abbrev-ref HEAD
    if ($currentBranch -eq "main") {
        Write-Host "You are on main branch"
        return $true
    }
    return $false
}
