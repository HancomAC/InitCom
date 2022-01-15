if (-not(Test-Path -Path "C:/JungolTemp")) {
	New-Item -Path "C:\" -Name "JungolTemp" -ItemType "directory"

	Invoke-WebRequest -Uri "https://repo.anaconda.com/archive/Anaconda3-2021.11-Windows-x86_64.exe" -OutFile "C:/JungolTemp/anaconda.exe"
	Invoke-WebRequest -Uri "http://jungol.co.kr/data/codeblocks-20.03mingw-setup.exe" -OutFile "C:/JungolTemp/cb.exe"
	Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "C:/JungolTemp/vscode.exe"
    Invoke-WebRequest -Uri "https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_windows-x64_bin.zip" -OutFile "C:/JungolTemp/java.zip"
    Invoke-WebRequest -Uri "https://ftp.yz.yamagata-u.ac.jp/pub/eclipse/oomph/epp/2021-12/R/eclipse-inst-jre-win64.exe" -OutFile "C:/JungolTemp/eclipse.zip"
}

New-Item -Path "C:\" -Name "CodeCPP" -ItemType "directory"
New-Item -Path "C:\" -Name "CodeJAVA" -ItemType "directory"
New-Item -Path "C:\" -Name "CodePYTHON" -ItemType "directory"

& C:/JungolTemp/cb.exe /S
& C:/JungolTemp/vscode.exe /Silent
& C:/JungolTemp/anaconda.exe /S

Expand-Archive -LiteralPath 'C:/JungolTemp/java.zip' -DestinationPath C:\JAVA
$env:JAVA_HOME = "C:\JAVA\jdk-11.0.1"
$env:Path += ";%JAVA_HOME%\bin"

New-Item -Path HKCU:\Software\Policies\Microsoft\Edge -Name RestoreOnStartupURLs –Force

$path = 'HKCU:\Software\Policies\Microsoft\Edge\RestoreOnStartupURLs'

$name = '1'

$value = 'http://jungol.co.kr'

Set-Itemproperty -Path $path -Name $name -Value $value

Remove-Item –path C:\JungolTemp –recurse
