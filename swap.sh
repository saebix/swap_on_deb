#!/bin/bash

# turn off swap
echo "turn off swap"
sudo swapoff -a

# delete old swapfile
echo "deleting old swapfile"
sudo rm -i /swapfile -y

# create new swapfile
echo "creating new swapfile"
sudo dd if=/dev/zero of=/swapfile bs=1M count=4096

# set new swap protection
echo "setting new swap protection"
sudo chmod 600 /swapfile

# turn on swap
echo "turn on swap"
sudo mkswap /swapfile
sudo swapon /swapfile

#write fstab
sudo echo "/swapfile                                 none            swap    sw              0       0" >> /etc/fstab
