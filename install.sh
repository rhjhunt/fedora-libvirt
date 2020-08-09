#!/bin/bash

set -euxo pipefail

cp host-files/etc/systemd/system/container-libvirtd.service /etc/systemd/system/container-libvirtd.service
cp host-files/usr/local/sbin/container-libvirtd /usr/local/bin/container-libvirtd
cp host-files/usr/local/sbin/container-libvirtd-rootless-enable /usr/local/bin/container-libvirtd-rootless-enable
chmod a+x /usr/local/bin/container-libvirtd
chmod a+x /usr/local/bin/container-libvirtd-rootless-enable
