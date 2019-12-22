# To elevate privelages to properlly install
# $ Start-Process PowerShell -Verb RunAs

# FIXING FIREWALL ISSUE
# https://github.com/microsoft/WSL/issues/4212

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install microsoft-windows-terminal
choco upgrade microsoft-windows-terminal

# enable the virtual machine platform
wdism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1804 -OutFile Ubuntu.appx -UseBasicParsing
# Install Ubuntu
Add-AppxPackage .\Ubuntu.appx


# Try restarting PowerShell now to see if everything works
# May need to run ubuntu1804.exe for everything to be found