# Vulkan compile command alias
function gvk {
    param (
        [string]$sourceFile
    )

    # Extract the base name (e.g., A01 from A01.cpp)
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($sourceFile)

    # Build the g++ command
    $command = "g++ -std=c++17 -Iheaders -O0 $sourceFile -o $baseName -lvulkan-1 -lglfw3 -lopengl32 -lgdi32"

    # Execute the command
    Invoke-Expression $command
}

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

# Move to home directory
Remove-Item Alias:cd
function cd {
	param (
		[string]$Path
	)

	if ($Path) {
		Set-Location -Path $Path
	} else {
		Set-Location -Path $HOME
	}
}

# Oh My Posh initialisation
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/powerlevel10k_rainbow.omp.json" | Invoke-Expression

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
