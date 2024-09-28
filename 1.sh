#!/bin/sh
mkfs.btrfs /dev/nvme0n1p2
mkfs.fat -F 32 /dev/nvme0n1p1
mount /dev/nvme0n1p2 /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/boot
reflector
pacstrap -K /mnt base linux linux-firmware intel-ucode sof-firmware networkmanager nano
genfstab -U /mnt >> /mnt/etc/fstab
