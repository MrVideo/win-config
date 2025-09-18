# Use CTRL+D to exit
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit

# Use CTRL+T to open a new tab with the same working directory
Set-PSReadlineKeyHandler -Key ctrl+t -ScriptBlock {
	Start-Process wt -ArgumentList "-w", "0", "nt", "-d", "."
}

# Use CTRL+V to open a vertical split with the same working directory
Set-PSReadlineKeyHandler -Key ctrl+v -ScriptBlock {
	Start-Process wt -ArgumentList "-w", "0", "split-pane", "--vertical", "-d", "."
}

# Use CTRL+S to open a horizontal split with the same working directory
Set-PSReadlineKeyHandler -Key ctrl+s -ScriptBlock {
	Start-Process wt -ArgumentList "-w", "0", "split-pane", "--horizontal", "-d", "."
}

# List hidden files
function la {
	Get-ChildItem . -Force
}

# Shortcut to Code directory
function code {
	Set-Location "$Home\Code"
}

# Shortcut to Perivallon directory
function pv {
	Set-Location "$Home\Code\Perivallon"
}

oh-my-posh init pwsh | Invoke-Expression
