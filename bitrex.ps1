﻿If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))

{   
$arguments = "& '" + $myinvocation.mycommand.definition + "'"
Start-Process powershell -Verb runAs -ArgumentList $arguments
Break
}
#Starts powershell as root

Set-Location -Path $PSScriptRoot
#Sets root location as same place as script

clear

#Start of bitlocker key extraction loop
	echo '--------------------------------------------------------------------------------------------' >>.\BitRecoveryKey.txt
	clear
	$choices = [System.Management.Automation.Host.ChoiceDescription[]] @("&Y","&N")
	while ( $true ) {

	manage-bde -status
	#Gets the bitlocker encryption status of the drives connected to the machine

	Write-Host "This is a list of the bitlocker encryption status of the drives connected to the machine"

	$Volume = Read-Host -prompt 'Input the drive letter of the encrypted volume(as a capital letter followed by a colon (Example: C:))'
	#Prompts the user to input the drive letter they want to decrypt

	Manage-bde -protectors -get $Volume -Type recoverypassword >> .\BitRecoveryKey.txt
	#Finds the recovery key and writes this to a .txt-file
	
	Write-Host " "
	Write-Host "Recovery key extracted!"
	
	  $choice = $Host.UI.PromptForChoice("Do you want to extract the recovery key for a second volume?","",$choices,0)
  if ( $choice -ne 0 ) {
  break
  }
echo '--------------------------------------------------------------------------------------------' >>.\BitRecoveryKey.txt
}

#End of bitlocker key extracktion loop



