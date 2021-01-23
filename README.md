DISCLAIMER:
  Use at your own risk. This is a hepler script which I use during my personal installations.
  However, if you find it useful, feel free to use and adapt as you  need.

IMPORTANT:
  - This is not an automatic installer, but a helper script intended to make my personal installations easier.
  - Read the script before using it. I left some comments that will help you modify the script to your personal needs.
  - The installation includes quite a bit of software. This is software which I find essential on my machines, feel free to modify as you please.
  - The scripts is intended to be used after chrooting into the newly installed system. (see here: https://wiki.archlinux.org/index.php/Installation_guide#Chroot)

HOW TO USE:
  - after chrooting into your new system, install git using "pacman -S git"
  - I recommend installing in /opt directory, but anywhere will work, to change directory to /opt, use "cd /opt"
  - clone the repository using "git clone https://github.com/lucazugic/arch-install-config"
  - change directory into the cloned repo using "cd arch-install-config"
  - if this is your first time using this, install your favourite text editor, mine is vim "pacman -S vim" and read the script using "vim configure.sh"
  - the script is intended for a configuration for the UK (qwerty) on an Intel machine, make changes to configure this for your needs!
  - execute the script using "bash configure.sh" or, if applies: "bash /path/to/script/configure.sh"
