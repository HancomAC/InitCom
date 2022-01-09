# InitCom

```powershell
Set-ExecutionPolicy Unrestricted

$scriptUrl = "https://raw.githubusercontent.com/HancomAC/InitCom/main/run.ps1"
$destination = "c:\test.txt"
$scriptName = "c:\test.ps1"

Invoke-WebRequest $scriptUrl -OutFile $destination

# if the file was downloaded, delete the old script file and rename the new
# file
if(test-path $destination){
    remove-item $scriptName
    Rename-Item $destination $scriptName
}

&$scriptName
```


```powershell
Set-ExecutionPolicy Unrestricted

$scriptUrl = "https://raw.githubusercontent.com/HancomAC/InitCom/main/install.ps1"
$destination = "c:\test.txt"
$scriptName = "c:\test.ps1"

Invoke-WebRequest $scriptUrl -OutFile $destination

# if the file was downloaded, delete the old script file and rename the new
# file
if(test-path $destination){
    remove-item $scriptName
    Rename-Item $destination $scriptName
}

&$scriptName
```
