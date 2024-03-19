# bitrex
Bitlocker recovery key extractor
PowerShell

This simple script lists the bitlocker status of the drives on your PC.  Based on this information you can then extract the recovery key of a drive when prompted.  The recovery key of multiple drives can be extracted, one after another. The recovery keys will be listed in the file "BitRecoveryKey.txt"

The file RUN.bat is there for ease of use, as you can double click this file to start the .ps1 script.

Note: If the script fails to open you may have to enable the use of scripts on the PC.  To do this open powershell as administrator, type:
Set-ExecutionPolicy RemoteSigned
Press enter and type "A", then press enter again.

You can now run scripts on your PC.
