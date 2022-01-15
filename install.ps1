if (-not(Test-Path -Path "C:/JungolTemp")) {
	    New-Item -Path "C:\" -Name "JungolTemp" -ItemType "directory"

	    Invoke-WebRequest -Uri "https://repo.anaconda.com/archive/Anaconda3-2021.11-Windows-x86_64.exe" -OutFile "C:/JungolTemp/anaconda.exe"
	    Invoke-WebRequest -Uri "http://jungol.co.kr/data/codeblocks-20.03mingw-setup.exe" -OutFile "C:/JungolTemp/cb.exe"
	    Invoke-WebRequest -Uri "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "C:/JungolTemp/vscode.exe"
	}

& "C:/JungolTemp/cb.exe /s"
& "C:/JungolTemp/vscode.exe /Silent"
& "C:/JungolTemp/anaconda.exe /s"
