# ArtemisAutoUpdater

## About

Artemis Auto Updater is a script that (you guessed it) automatically updates [Wynntils Artemis](https://ci.wynntils.com/job/Artemis/) when an update is available. It will also download Artemis if it is not downloaded at all.

## Requirements

* Operating System: Windows 10/11
* [Prism Launcher](https://prismlauncher.org/) or [MultiMC](https://multimc.org/)

## Usage

1. Open the settings of an instance of your Minecraft 1.18.2 (create one if you haven't but remember to pick mod loader!)
1. Go to the Custom Commands tab
1. Copy the text below, and paste it into Pre-launch command field 

```ps1
Powershell.exe Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/Rafii2198/ArtemisAutoUpdater/main/ArtemisUpdate.ps1'))
```
## Contributing

As a matter of fact, this is my first ever script, so I think there is room for improvement. If you want to, you can always make a pull request to help me!

## To-do

- Script for Linux
- Script for Legacy
