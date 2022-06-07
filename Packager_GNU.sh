#!/bin/bash
echo " "
echo "Welcome to the Kirby Air Ride Packager, created by Eternalll#6100 for the Kirby Workshop Community. https://kirbyairri.de"
sleep 5
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/PackagerVersion_GNU.txt
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/GeckoVersion.txt
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/NetplayVersion.txt
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Motd/gnu_Motd.txt
echo " "
echo "The Master Server reports the following versions as the latest:"
echo " "
cat 'NetplayVersion.txt'
echo " "
cat 'PackagerVersion_GNU.txt'
echo " "
cat 'GeckoVersion.txt'
echo " "
echo " "
sleep 3
rm 'NetplayVersion.txt'
rm 'PackagerVersion_GNU.txt'
rm 'GeckoVersion.txt'
echo "The current versions of your Packager are:"
echo " "
cat './Sys/Resources/PackagerVersion_GNU.txt'
echo " "
cat './Sys/Resources/GeckoVersion.txt'
echo " "
echo " "
sleep 3
cat 'gnu_Motd.txt'
rm 'gnu_Motd.txt'
echo " "
sleep 5
read -p "Press Enter to update Packager"
read -p "Press Enter again to confirm you read and understand the information above"
echo "We are now updating Packager..."
sleep 2
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/PackagerVersion_GNU.txt
mv PackagerVersion_GNU.txt './Sys/Resources/'
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Packager_GNU.sh
mv -f Packager_GNU.sh.1 Packager_GNU.sh
echo "Packager was updated. Please exit and restart if your local version was different from the reported server version."
echo " "
sleep 3
read -p "Press Enter to update Gecko Codes"
echo "Updating Gecko Codes..."
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/GKYE01.ini
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/KHPE01.ini
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/modifier_guide.txt
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/GeckoVersion.txt
mv GeckoVersion.txt "./Sys/Resources/"
mv GKYE01.ini "/home/$USER/.local/share/dolphin-emu/GameSettings/"
mv KHPE01.ini "/home/$USER/.local/share/dolphin-emu/GameSettings/"
mv modifier_guide.txt "/home/$USER/.local/share/dolphin-emu/GameSettings/"
echo " "
read -p "Press Enter to patch Dolphin."
echo "Patching Dolphin should only be done on your first run, or when you want to reset to pre-set default settings. Exit the script if you do not wish to do this."
read -p "Press Enter to set default settings."
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Config/Dolphin.ini
mv Dolphin.ini "/home/$USER/.config/dolphin-emu"
read -p "Press Enter to reset graphics settings."
wget https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Config/GFX.ini
mv GFX.ini "/home/$USER/.config/dolphin-emu"
echo "Kirby Air Ride can now be played online."
read -p "Press Enter to exit"