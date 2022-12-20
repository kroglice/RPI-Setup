#!/bin/sh

sudo apt update

#sudo echo "dtoverlay=dwc2" >> /boot/config.txt
echo 'dtoverlay=dwc2' | sudo tee --append /boot/config.txt
sudo sed -i 's/rootwait/rootwait modules-load=dwc2,g_ether/' /boot/cmdline.txt
