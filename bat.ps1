Set-Alias -Name cat -Value "bat" -Option AllScope
$env:FZF_DEFAULT_OPTS = '--preview "bat --color=always --style=numbers --line-range=:500 {}"'
$env:BAT_THEME = "Dracula"

