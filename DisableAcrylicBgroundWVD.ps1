<#	
	.NOTES
	===========================================================================
		 Created on:   	14/08/2020 10:37
	 Created by:   	Ryan Mangan
	 Organization: 	Ryanmangansitblog.com
	 Filename:     	Disable Acrylic Background on Logon - Offers WVD CPU Improvements 
	===========================================================================
	.DESCRIPTION
		This simple script is to be used with Azure Custom Scrpt Extentions for each session host. This disables the Acrylic Background On Logon.

Registry Hive	HKEY_LOCAL_MACHINE
Registry Path	Software\Policies\Microsoft\Windows\System
Value Name	DisableAcrylicBackgroundOnLogon
Value Type	REG_DWORD
Enabled Value	1
Disabled Value	0
	
	
#>

# Add registry Key

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v DisableAcrylicBackgroundOnLogon /t REG_DWORD /d 1 /f

