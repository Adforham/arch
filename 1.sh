#!/bin/sh
mkfs.ext4 /dev/sda2
mkfs.fat -F 32 /dev/sda1
mount /dev/sda2 /mnt
mount --mkdir /dev/sda1 /mnt/boot
reflector
pacstrap -K /mnt base linux linux-firmware intel-ucode sof-firmware networkmanager nano
genfstab -U /mnt >> /mnt/etc/fstab
