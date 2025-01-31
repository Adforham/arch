#!/bin/sh
mkfs.ext4 /dev/nvme0n1p2
mkfs.fat -F 32 /dev/nvme0n1p1
mount /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
pacstrap -K /mnt base linux linux-firmware networkmanager nano
genfstab -U /mnt >> /mnt/etc/fstab
