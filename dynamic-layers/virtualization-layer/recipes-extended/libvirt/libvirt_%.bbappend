FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
SRC_URI_append = " file://qemu-support-virt-2.6-machine-type-on-arm.patch"
