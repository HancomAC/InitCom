if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}

if(-not($env:UserName -imatch "student")) {
	New-LocalUser -Name "student" -Description "Jungol Student" -NoPassword -UserMayNotChangePassword
	$locUser = [ADSI]"WinNT://./student,User"
	$locUser.PasswordExpired = 0
	$locUser.SetInfo()
	Set-LocalUser "Student" -PasswordNeverExpires $true
	Add-LocalGroupMember -Group "users" -Member "student"
}

else {
	if (-not(Test-Path -Path "C:/JungolTemp")) {
	    New-Item -Path "C:\" -Name "JungolTemp" -ItemType "directory"
	
	    Invoke-WebRequest -Uri "https://repo.anaconda.com/archive/Anaconda3-2021.11-Windows-x86_64.exe" -OutFile "C:/JungolTemp/anaconda.exe"
	    Invoke-WebRequest -Uri "http://jungol.co.kr/data/codeblocks-20.03mingw-setup.exe" -OutFile "C:/JungolTemp/cb.exe"
	    Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "C:/JungolTemp/vscode.exe"
	}
	
	Start-Process "C:/JungolTemp/cb.exe /s"
	Start-Process "C:/JungolTemp/vscode.exe /Silent"
	Start-Process "C:/JungolTemp/anaconda.exe /s"
}