# Console Info
Write-Output `a"Welcome to the Kirby Air Ride Packager, created by Eternalll#6100 for the Kirby Workshop Community https://kirbyairri.de"
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Cyan"
Write-Output `a"This version of Packager is approved to run on the following latest Dolphin version."
Write-Output `a" "
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/NetplayVersion.txt' -OutFile 'NetplayVersion.txt'
Get-Content -Path ".\NetplayVersion.txt"
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Green"
Write-Output `a"The server reports the following versions as the latest."
Write-Output `a"If versions match, you do not need to perform updates."
Write-Output `a" "
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/PackagerVersion.txt' -OutFile 'PackagerVersion.txt'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/GeckoVersion.txt' -OutFile 'GeckoVersion.txt'
Get-Content -Path ".\PackagerVersion.txt"
Get-Content -Path ".\GeckoVersion.txt"  
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "Yellow"
Write-Output `a"Your local Packager version is listed as the following."
Write-Output `a" "
Get-Content -Path ".\Sys\Resources\PackagerVersion.txt"
Get-Content -Path ".\Sys\Resources\GeckoVersion.txt"
Write-Output `a" "
$host.UI.RawUI.ForegroundColor = "White"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Motd/win_Motd.txt' -OutFile 'win_Motd.txt'
Get-Content -Path ".\win_Motd.txt"
Write-Output `a" "
# Post Initialization
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/background.png' -OutFile 'background.png'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/karonline.ico' -OutFile 'karonline.ico'
move-Item "background.png" -Destination ".\Sys\Resources" -force
move-Item "karonline.ico" -Destination ".\Sys\Resources" -force
Remove-Item ".\PackagerVersion.txt" -force
Remove-Item ".\GeckoVersion.txt" -force
Remove-Item ".\NetplayVersion.txt" -force
Remove-Item ".\win_Motd.txt" -force
# OneDrive Checks
$a = Test-Path "C:\Users\$env:UserName\OneDrive\Documents\Dolphin Emulator"
IF ($a -eq $true){
$host.UI.RawUI.ForegroundColor = "Red"
Write-Output `a'Packager has detected use of OneDrive folder redirection. Please use the Packager_OneDrive.ps1 script instead.'
pause
stop-process -Id $PID
}ELSE{
Write-Output `a"Packager successfully intialized. Please select an action below."
}

# Build GUI

Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName PresentationCore,PresentationFramework
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text ='Kirby Air Ride Packager'
$main_form.Width = 400
$main_form.Height = 400
$main_form.AutoSize = $true

$main_form.MinimizeBox = $False
$main_form.MaximizeBox = $False
$main_form.ShowInTaskbar = $False
$main_form.StartPosition = "CenterScreen"

$Font = New-Object System.Drawing.Font("Arial",12,[System.Drawing.FontStyle]::Bold)
$main_form.Font = $Font

$Image = [system.drawing.image]::FromFile(".\Sys\Resources\background.png")
$main_form.BackgroundImage = $Image
$main_form.BackgroundImageLayout = "None"
$main_form.Width = $Image.Width
$main_form.Height = $Image.Height

$Icon = New-Object system.drawing.icon (".\Sys\Resources\karonline.ico")
$main_form.Icon = $Icon

# Patch Dolphin

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,40)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#D9534F"
$Button.Text = "Patch Dolphin"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

[System.Windows.MessageBox]::Show('We will now Patch Dolphin and reset settings to default/netplay optimized.')
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/GeckoVersion.txt' -OutFile 'GeckoVersion.txt'
move-Item "GeckoVersion.txt" -Destination ".\Sys\Resources" -force
Set-Location -Path "C:\Users\$env:UserName\Documents\Dolphin Emulator\GameSettings"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/GKYE01.ini' -OutFile 'GKYE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/KHPE01.ini' -OutFile 'KHPE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/modifier_guide.txt' -OutFile 'modifier_guide.txt'
Set-Location -Path "C:\Users\$env:UserName\Documents\Dolphin Emulator\Config"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Config/Dolphin.ini' -OutFile 'Dolphin.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Config/GFX.ini' -OutFile 'GFX.ini'
[System.Windows.MessageBox]::Show('Kirby Air Ride can now be played online.','Patch Success')
stop-process -Id $PID

}

)# Packager Update

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,80)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#428BCA"
$Button.Text = "Packager Update"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

[System.Windows.MessageBox]::Show('Attempting to update Packager content.','Packager Update Notice')
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Packager.ps1' -OutFile 'Packager.ps1'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/PackagerVersion.txt' -OutFile 'PackagerVersion.txt'
move-Item "PackagerVersion.txt" -Destination ".\Sys\Resources" -force
[System.Windows.MessageBox]::Show('Packager has been updated.','Update Success')
stop-process -Id $PID

}
) # Workshop Discord

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,120)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.Text = "Join Discord"
$Button.BackColor = "#428BCA"
$main_form.Controls.Add($Button)
$Button.Add_Click(
{

Start-Process -FilePath http://discord.kirbyairri.de/

}
) # Gecko Restore Process

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,160)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#5CB85B"
$Button.Text = "Restore Gecko Codes"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

    [System.Windows.MessageBox]::Show('Select your directory to restore codes from. This directory must contain .ini files ONLY.','Gecko Code Restore')
$shell = New-Object -ComObject Shell.Application
$selectedfolder = $shell.BrowseForFolder( 0, 'Select Directory Containing Backup', 16, $shell.NameSpace( 17 ).Self.Path ).Self.Path
copy-Item "$selectedfolder\GKYE01.ini" -Destination "C:\Users\$env:UserName\Documents\Dolphin Emulator\GameSettings"
copy-Item "$selectedfolder\KHPE01.ini" -Destination "C:\Users\$env:UserName\Documents\Dolphin Emulator\GameSettings"
[System.Windows.MessageBox]::Show('Gecko Codes Restored.','Gecko Code Restore')
stop-process -Id $PID

}

) # Gecko Backup and Update Process

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,200)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.Text = "Backup and Update Gecko"
$Button.BackColor = "#5CB85B"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

$host.UI.RawUI.BackgroundColor = "DarkBlue"
$host.UI.RawUI.ForegroundColor = "DarkBlue"
$Host.PrivateData.ErrorForegroundColor = "DarkBlue"
[System.Windows.MessageBox]::Show('You will be asked to back up your codes first. If you do not wish to do so, select Cancel when it asks for the path.','Gecko Backup and Update Notice')
$shell = New-Object -ComObject Shell.Application
$selectedfolder = $shell.BrowseForFolder( 0, 'Select Where To Save Backup', 16, $shell.NameSpace( 17 ).Self.Path ).Self.Path
Set-Location -Path User\Gamesettings
copy-Item "GKYE01.ini" -Destination $selectedfolder
copy-Item "KHPE01.ini" -Destination $selectedfolder
[System.Windows.MessageBox]::Show('Press OK to update Gecko Codes and exit Packager.','Gecko Backup and Update Notice')
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/GeckoVersion.txt' -OutFile 'GeckoVersion.txt'
move-Item "GeckoVersion.txt" -Destination ".\Sys\Resources" -force
Set-Location -Path "C:\Users\$env:UserName\Documents\Dolphin Emulator\GameSettings"
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/GKYE01.ini' -OutFile 'GKYE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/KHPE01.ini' -OutFile 'KHPE01.ini'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/modifier_guide.txt' -OutFile 'modifier_guide.txt'
[System.Windows.MessageBox]::Show('Gecko Codes Updated.','Gecko Codes Update')
stop-process -Id $PID

}
) # Get Help

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,240)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.Text = "Get Help"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

Start-Process -FilePath https://www.kirbyairri.de/winpackager.html

}

) # Exit Packager

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(70,280)
$Button.Size = New-Object System.Drawing.Size(250,30)
$Button.BackColor = "#D9534F"
$Button.Text = "Close"
$main_form.Controls.Add($Button)
$Button.Add_Click(

{

stop-process -Id $PID

}

)

$main_form.ShowDialog()