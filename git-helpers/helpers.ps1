function main-check{
$currentBranch = git rev-parse --abbrev-ref HEAD
    if ($currentBranch -eq "main") {
        return $true
    }
    return $false
}
