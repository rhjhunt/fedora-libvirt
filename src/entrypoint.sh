#!/bin/sh

if [ $(find /etc/libvirt -maxdepth 0 -empty | wc -l) != 0 ]; then
    echo "/etc/libvirt is empty, populating it with default configs."
    cp -raT /etc/libvirt-default /etc/libvirt
fi

mkdir -p /var/lib/libvirt/images
mkdir -p /var/log/libvirt

mkdir -p /run/lock

# Make sure permissions on /dev/kvm are correct.
if [ -c /dev/kvm ]; then
	chown qemu:qemu /dev/kvm
else
	echo "*** no /dev/kvm"
fi

exec "$@"
