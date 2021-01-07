# System

IMPORTANT: I have never tested this! I will soon, when I return to student dorms, where I can test this on some secondary machine.

DISCLAIMER: Use at your own risk! If somethng brakes, I take no responsiblity! Also, this is NOT an Arch Installation Script!
This is a personal set-up, it isn't intended to please the masses and contains software I like,
configurations I use, and my own scripts like start.py

If you find these scripts/configurations useful, feel free to copy and customize however you please.
Remeber to not use this before chrooting into new system (see here: https://wiki.archlinux.org/index.php/Installation_guide#Chroot)

Please note: This script will install and download quite a bit of software, which I use on my installs. If you don't want this, please edit the configure_system.sh
script accordingly, or simply use the very helpful and rather short arch wiki installation guide. Which is already beautifully written!

The configure_system.sh file configures the system during your initial installation after you have followed the installation wiki to the stage of chrooting.
The configuration is not universally applicable and includes my software preferances, my local timezone (London, Europe) and locale configurations (en_GB.UTF-8).
Hence, I recommend you personalize these setting.
I have added comments to highlight where I recommend such modifications to be done.
Remeber the KISS philosophy! Don't just use this repo to have an "easy installation"! Configure your own system, that's the beauty of Arch!
