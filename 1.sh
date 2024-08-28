#!/bin/sh
iwctl --passphrase 150199150199 station wlan0 connect AlaaT
mkfs.btrfs /dev/sda2
mkfs.fat -F 32 /dev/sda1
mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot
pacstrap -K /mnt base linux linux-firmware intel-ucode sof-firmware networkmanager nano fastfetch
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

