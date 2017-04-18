
# Load posh-git example profile
. 'C:\tools\poshgit\dahlbyk-posh-git-19f3f2e\profile.example.ps1'

Rename-Item Function:\Prompt PoshGitPrompt -Force
function Prompt() {if(Test-Path Function:\PrePoshGitPrompt){++$global:poshScope; New-Item function:\script:Write-host -value "param([object] `$object, `$backgroundColor, `$foregroundColor, [switch] `$nonewline) " -Force | Out-Null;$private:p = PrePoshGitPrompt; if(--$global:poshScope -eq 0) {Remove-Item function:\Write-Host -Force}}PoshGitPrompt}

#Setup Alias
Set-Alias npp 'C:\Program Files (x86)\Notepad++\Notepad++.exe'
Set-Alias vs2017 'C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\IDE\devenv.exe'

#Setup Gulp
Invoke-Expression ((gulp --completion=powershell) -join [System.Environment]::NewLine)


#Custom Functions
Function greprl ($FileType, $pattern)
{
	Get-ChildItem -Recurse $FileType | Select-String -Pattern $pattern | Select-Object -Unique Path
}
