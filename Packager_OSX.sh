#!/bin/bash
echo " " 
echo "Welcome to the Kirby Air Ride Packager, created by Eternalll#6100 for the Kirby Workshop Community. https://kirbyairri.de"
echo "With assistance from !Hibyehello#5498, knux#6598 and Majestic#3774 from the Dolphin Discord. Thank you!"
sleep 5
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/PackagerVersion_OSX.txt' -LO
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/GeckoVersion.txt' -LO
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/NetplayVersion.txt' -LO
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Motd/osx_Motd.txt' -LO
echo " "
echo "The Master Server reports the following versions as the latest:"
echo " "
cat 'NetplayVersion.txt'
echo " "
cat 'PackagerVersion_OSX.txt'
echo " "
cat 'GeckoVersion.txt'
echo " "
echo " "
sleep 3
rm 'NetplayVersion.txt'
rm 'PackagerVersion_OSX.txt'
rm 'GeckoVersion.txt'
echo "The current versions of your Packager instance are:"
echo " "
cat './Sys/Resources/PackagerVersion_OSX.txt'
echo " "
cat './Sys/Resources/GeckoVersion.txt'
echo " "
echo " "
sleep 3
cat 'osx_Motd.txt'
rm 'osx_Motd.txt'
echo " "
sleep 5
read -p "Press Enter to update Packager"
read -p "Press Enter again to confirm you read and understand the information above"
echo "We are now updating Packager..."
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Resources/PackagerVersion_OSX.txt' -LO
mv PackagerVersion_OSX.txt './Sys/Resources/'
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Packager_OSX.sh' -LO
echo "Packager was updated. Please exit and restart if your local version was different from the reported server version."
echo " "
read -p "Press Enter to update Gecko Codes"
echo "Updating Gecko Codes..."
cd ~/'Library/Application Support/Dolphin/Gamesettings/'
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/GKYE01.ini' -LO
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/KHPE01.ini' -LO
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/User/Gamesettings/modifier_guide.txt' -LO
read -p "Press Enter to patch Dolphin."
echo "Patching Dolphin should only be done on your first run, or when you want to reset to pre-set default settings. Exit the script if you do not wish to do this."
read -p "Press Enter to set default settings."
cd ~/'Library/Application Support/Dolphin/Config/'
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Config/Dolphin.ini' -LO
read -p "Press Enter to reset graphics settings."
curl -sS 'https://raw.githubusercontent.com/sonicboom0075/PackagerMirror/master/Sys/Config/GFX.ini' -LO
echo "Kirby Air Ride can now be played online."
read -p "Press Enter to exit"