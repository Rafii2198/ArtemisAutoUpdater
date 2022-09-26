# ArtemisAutoUpdater

## About

Artemis Auto Updater is a script that (you guessed it) automatically updates [Wynntils Artemis](https://ci.wynntils.com/job/Artemis/) when update is available. It will also download Artemis if it is not downloaded at all.

## Requirements

* Operating System: Windows 10/11
* [PolyMC](https://polymc.org/) or [MultiMC](https://multimc.org/)

## Usage

1. Open the settings of an instance of your Minecraft 1.18.2 (create one if you haven't)
1. Go to the Custom Commands tab
1. Copy one of the strings below, depending on your mod loader, and paste them into Pre-launch command field
   - Forge: `Powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; $INST_MC_DIR/ArtemisUpdate.ps1 "$INST_MC_DIR" "forge"`
   - Fabric: `Powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; $INST_MC_DIR/ArtemisUpdate.ps1 "$INST_MC_DIR" "fabric"`
   - Quilt: `Powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; $INST_MC_DIR/ArtemisUpdate.ps1 "$INST_MC_DIR" "quilt"`
4. Go to [Releases](https://github.com/Rafii2198/ArtemisAutoUpdater/releases) and download the latest script file
5. Place downloaded file in .minecraft folder of your instance
    - If you don't know where that folder is, then right-click on your instance and select Minecraft Folder

## Contributing

As a matter of fact, this is my first ever script, so I think there is room for improvement. If you want to, you can always make a pull request to help me!

## To-do

- Script for Linux
- Script for Legacy
