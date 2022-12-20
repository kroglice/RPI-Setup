#!/bin/sh

set -e

if ! sudo_cmd grep -q 'dtoverlay=dwc2' /boot/config.txt; then
  # shellcheck disable=SC2016
  sudo_cmd sed -i '$a dtoverlay=dwc2' /boot/config.txt
fi
if ! sudo_cmd grep -q 'modules-load=dwc2' /boot/cmdline.txt; then
  # shellcheck disable=SC2016
  sudo_cmd sed -i '$s/$/ modules-load=dwc2/g' /boot/cmdline.txt
fi
sudo_cmd touch /boot/ssh
if ! sudo_cmd grep -q 'libcomposite' /etc/modules; then
  # shellcheck disable=SC2016
  sudo_cmd sed -i '$a libcomposite' /etc/modules
fi
if ! sudo_cmd grep -q 'denyinterfaces usb0' /etc/dhcpcd.conf; then
  # shellcheck disable=SC2016
  sudo_cmd sed -i '$a denyinterfaces usb0' /etc/dhcpcd.conf
fi
cmd mkdir -p /etc/dnsmasq.d
cmd mkdir -p /etc/network/interfaces.d
copy_as /etc/dnsmasq.d/usb
copy_as /etc/network/interfaces.d/usb0
copy_as /root/usb.sh
sudo_cmd chmod 755 /root/usb.sh
if ! sudo_cmd grep -q '/root/usb\.sh' /etc/rc.local; then
  # shellcheck disable=SC2016
  sudo_cmd sed -i '$i sh /root/usb.sh\n' /etc/rc.local
fi
