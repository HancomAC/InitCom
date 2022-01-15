New-Item -Path HKCU:\Software\Policies\Microsoft\Edge -Name RestoreOnStartupURLs –Force

$path = 'HKCU:\Software\Policies\Microsoft\Edge\RestoreOnStartupURLs'

$name = '1'

$value = 'http://jungol.co.kr'

Set-Itemproperty -Path $path -Name $name -Value $value

New-Item -ItemType SymbolicLink -Path "C:\Users\student\Desktop" -Name "JUNGOL.lnk" -Value "http://jungol.co.kr"

Invoke-WebRequest -Uri "https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_windows-x64_bin.zip" -OutFile "C:/JungolTemp/java.zip"
Invoke-WebRequest -Uri "https://ftp.yz.yamagata-u.ac.jp/pub/eclipse/oomph/epp/2021-12/R/eclipse-inst-jre-win64.exe" -OutFile "C:/JungolTemp/eclipse.zip"
Expand-Archive -LiteralPath 'C:/JungolTemp/java.zip' -DestinationPath C:\JAVA
$env:JAVA_HOME = "C:\JAVA\jdk-11.0.1"
$env:Path += ";%JAVA_HOME%\bin"

Remove-Item –path C:\JungolTemp –recurse