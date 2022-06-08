# PackagerMirror
This is a re-upload of a Kirby Air Ride modding tool made by Eternalll#6100 for the Kirby Workshop Community.

Kirby Workshop: https://discord.com/invite/uMfd7yM

##### Original README.md follows:

# Packager for Kirby Air Ride
## What is Packager?
Packager is a 10Kb zip file that includes scripts and resources for all operating systems. All scripts will:

* Patch mainline Dolphin for the latest Air Ride.
* Check for updates automatically (but not update automatically).
* Pull the latest Gecko codes available.
##### Do not bother Dolphin developers regarding anything related to Packager.

## Pre-requisites
1. Download the latest supported Dolphin Beta Version.
2. Download Packager content.
3. Run Dolphin Emulator at least once so that the folders exist for the script to use.
> Beware that when you patch Dolphin, your config and graphics settings are reset. Configure those after the steps below are complete.

## Windows
1. Right click Packager.ps1, run with Powershell, then have it Patch Dolphin.
   * For those using OneDrive folder redirection, use Packager_OneDrive.ps1 instead.
2. You should receive a successful patch message when the process completes, with no errors in the console.
   * Other functions are available to use after Patching Dolphin if you wish.
> If PowerShell is giving an error regarding execution policy, you will need to change PS to allow remote signed scripts. Set-ExecutionPolicy RemoteSigned or Set-ExecutionPolicy Unrestricted

## MacOS
1. Open a Terminal session and change directory to where you have Packager.
2. Run chmod a+x Packager_OSX.sh to set the script as executable.
3. Run ./Packager_OSX.sh to run the script.
4. Script will run, follow instructions provided within the script.

## Linux
1. Open a Terminal session and change directory to where you have Packager.
2. Run chmod a+x Packager_GNU.sh to set the script as executable.
3. Run ./Packager_GNU.sh to run the script.
4. Script will run, follow instructions provided within the script.
> It is assumed you know how to compile your own builds, compatible with the other NetPlay dolphin versions. Due to complications and massive variations in distributions, we do not provide pre-compiled builds or any support regarding this. Since it is mainline Dolphin, you can view their docs 1:1 and receive support from them if necessary.
