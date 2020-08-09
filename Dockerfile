FROM registry.fedoraproject.org/fedora:32

LABEL	name="fedora-libvirt" \
	version="1.0" \
	architecture="x86_64" \
	vcs-type="git" \
	summary="libvirt running in a container for systems such as Fedora Silverblue." \
	maintainer="Jacob Hunt <jhunt@redhat.com>"

RUN dnf -y update && \
    dnf -y --setopt=tsflags='' install nss-altfiles libvirt qemu-kvm && \
    dnf clean all && \
    mv /etc/libvirt /etc/libvirt-default && \
    mkdir /etc/libvirt

COPY files /

CMD ["/usr/local/bin/container_libvirtd"]
