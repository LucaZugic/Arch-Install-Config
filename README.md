# System

IMPORTANT: I have never tested this! I will soon, when I return to student dorms, where I can test this on some secondary machine.

DISCLAIMER: Use at your own risk! If somethng brakes, I take no responsiblity! Also, this is NOT an Arch Installation Script!
This is a personal set-up, it isn't intended to please the masses and contains software I like,
configurations I use, and my own scripts like start.py

To summarize each script:
configure_system.sh installs and configures a system as I use on my main machine
empty_system.sh installs only software I find essential
start.py is a python script that executes startx for you (Revolutionary, right?)

If you find these scripts/configurations useful, feel free to copy and customize however you please.
Remeber to not use this before chrooting into new system (see here: https://wiki.archlinux.org/index.php/Installation_guide#Chroot)

Please note: The configure_system.sh script will install and download quite a bit of software, which I use on my installs. If you don't want this,
please edit the configure_system.sh script accordingly. Alternaitvely, you can just install using the beautifully written Arch Wiki, or using the configure_empty.sh 
ile which contains only the software I find essential.

The configure_system.sh or configure_empty.sh files configure the system during your initial installation after you have followed the installation
wiki to the stage of chrooting.
The configuration is not universally applicable and includes my software preferances, my local timezone (London, Europe) and locale configurations (en_GB.UTF-8).
Hence, I recommend you personalize these setting.
I have added comments to highlight where I recommend such modifications to be done.
Remeber the KISS philosophy! And configure your own system, that's the beauty of Arch!
