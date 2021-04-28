FROM registry.fedoraproject.org/fedora:34

LABEL	name="fedora-libvirt" \
	version="1.3" \
	architecture="x86_64" \
	vcs-type="git" \
	summary="libvirt running in a container for systems such as Fedora Silverblue." \
	io.containers.autoupdate="image" \
	maintainer="Jacob Hunt <jhunt@redhat.com>"


RUN echo 'fastestmirror=1' >> /etc/dnf/dnf.conf

RUN dnf -y update && \
    dnf -y --setopt=tsflags='' install \
    nss-altfiles qemu virt-install libvirt qemu-kvm libvirt-dbus firewalld nmap-ncat && \
    dnf clean all && \
    mv /etc/libvirt /etc/libvirt-default && \
    mkdir /etc/libvirt

RUN systemctl enable libvirtd
RUN systemctl enable virtlockd

VOLUME /var/lib/libvirt
VOLUME /var/log/libvirt
VOLUME /run

EXPOSE 16509

COPY src/ /

RUN echo 'LIBVIRTD_ARGS="--listen"' >> /etc/sysconfig/libvirtd

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/sbin/init"]
