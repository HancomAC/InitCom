
	New-LocalUser -Name "student" -Description "Jungol Student" -NoPassword -UserMayNotChangePassword
	$locUser = [ADSI]"WinNT://./student,User"
	$locUser.PasswordExpired = 0
	$locUser.SetInfo()
	Set-LocalUser "Student" -PasswordNeverExpires $true
	Add-LocalGroupMember -Group "users" -Member "student"
