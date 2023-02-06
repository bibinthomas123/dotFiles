#prompt 
Import-Module posh-git
Import-Module oh-my-posh

#Load prompt
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }

$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'bibinThomas.omp.json'
# $PROMPT_CONFIG =  '\C:\Users\Bibin\.config\powershell\bibinThomas.omp.json'

oh-my-posh init pwsh --config $PROMPT_CONFIG | Invoke-Expression


Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -predictionViewStyle ListView     

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'



# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Function GoToFolder {
    Set-Location 'D:\'
}
Set-Alias -Name teleport -Value GoToFolder


# Utilities
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
      Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
  }
  
