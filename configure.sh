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
echo "installing git, xorg, xinit, vim, sudo, feh, OpenJDK JRE 11, OpenJDK JDK 11, base-devel, and dhcpcd...
pacman -S git, xorg xinit vim sudo dhcpcp jre11-openjdk jdk11-openjdk base-devel
echo "adding $username to wheel, audio, video, optical, and storage groups"
usermod -aG wheel,audio,video,optical,storage $username
echo "$username was succesfully added to the following groups:"
groups $username
echo "configuring sudoers file..."
# If you want to type your password every time you use sudo, comment the next line, and uncomment the one after
sed -i "/wheel ALL=(ALL) NOPASSWD/s/^#//g" /etc/sudoers
#sed -i "/wheel ALL=(ALL) ALL/s/^#//g" /etc/sudoers
echo "members of wheel group added to use sudo"
echo "enableing dhcpcd.service"
systemctl enable dhcpcd
echo "If you need wifi support, remember to install iwd!"
echo "installing grub..."
sudo pacman -S grub
echo "After grub configuration, Crtl + D or type 'exit' to exit chroot."
echo "You will then be able to reboot. but make sure that your grub configuration runs proberly first!"
echo "configuring grub..."
# I have left this until the end because there is quite often some troubleshooting involved.
# Usually these are fixed by specifying the boot partition path.
grub-mkconfig -o /boot/grub/grub.cfg
