#!/bin/bash
echo "setting time zone to London, Europe"
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
echo "generating /etc/adjtime..."
hwclock --systohc
echo "done"
# Edit following 2 lines if not in the UK
echo "configuring and generating locale to en_GB.UTF-8..."
sed -i "/en_GB.UTF-8/s/^#//g" /etc/locale.gen
locale-gen
echo "done"
# Edit following 2 lines if not in the UK
echo "setting locale LANG variable to en_GB.UTF-8..."
echo "LANG=en_GB.UTF-8" > /etc/locale.conf
echo "done"
# Edit following 2 lines if not in the UK
echo "setting uk keymap"
echo "KEYMAP=uk" > /etc/locale.conf
echo "done"
read -p "Enter prefered hostname: " hostname
echo "setting hostname..."
echo "$hostname" > /etc/hostname
echo -e "127.0.0.1         localhost\n::1               localhost\n127.0.1.1         $hostname.localdomain   $hostname" > /etc/hosts
echo "done"
# Edit following 2 lines if not using Intel processor
echo "installing intel processor microcode..."
sudo pacman -S intel-ucode
echo "set root passwd"
passwd
read -p "Set your username: " username
useradd -m $username
echo "set passwd for $username"
passwd $username
# Edit the following lines if you don't like my software choices
echo "installing git, xorg, xinit, vim, sudo, feh, OpenJDK JRE 11, OpenJDK JDK 11, base-devel, and dhcpcd..."
pacman -S git
pacman -S xorg
pacman -S xinit
pacman -S vim
pacman -S sudo
pacman -S dhcpcd
pacman -S jre11-openjdk
pacman -S jdk11-openjdk
pacman -S base-devel
pacman -S iwd
echo "adding $username to wheel, audio, video, optical, and storage groups"
usermod -aG wheel,audio,video,optical,storage $username
echo "$username was succesfully added to the following groups:"
groups $username
echo "configuring sudoers file..."
# If you want to type your password every time you use sudo, comment the next line, and uncomment the one after
sed -i "/wheel ALL=(ALL) NOPASSWD/s/^#//g" /etc/sudoers
#sed -i "/wheel ALL=(ALL) ALL/s/^#//g" /etc/sudoers
echo "members of wheel group added to use sudo"
echo "enableing dhcpcd.service and iwd.service"
systemctl enable dhcpcd
systemctl enable iwd
echo "installing grub..."
sudo pacman -S grub
read -p "Enter your installation partition, this could be something like /dev/sda, not something like /dev/sda1" partition
echo "finishing grub installation"
grub-install $partition
echo "Adding grub configuration file /boot/grub/grub.cfg"
grub-mkconfig -o /boot/grub/grub.cfg
