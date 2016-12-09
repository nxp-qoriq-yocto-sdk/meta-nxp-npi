SUMMARY = "Reset Configuration Word"
DESCRIPTION = "Reset Configuration Word - hardware boot-time parameters for the QorIQ targets"
LICENSE = "Freescale-EULA"
LIC_FILES_CHKSUM = "file://EULA;md5=88d9c47310cb06789d867719b9896ef1"

INHIBIT_DEFAULT_DEPS = "1"

inherit deploy

SRC_URI = "git://sw-stash.freescale.net/scm/dnnpi/ls1012-rcw.git;branch=ls1012a_brngup_bin;protocol=http"
SRCREV = "8103bb1f7d34aceac6394a9bcfebfc80b9ad625b"

S = "${WORKDIR}/git"

M = "${@d.getVar('MACHINE', True).replace('-32b','')}"
do_install () {
    install -d ${D}/boot/rcw
    cp -r ${S}/${M}/* ${D}/boot/rcw/
}

do_deploy () {
    install -d ${DEPLOYDIR}/rcw
    cp -r ${D}/boot/rcw/* ${DEPLOYDIR}/rcw/
}
addtask deploy after do_install

PACKAGES += "${PN}-image"
FILES_${PN}-image += "/boot"

PACKAGE_ARCH = "${MACHINE_ARCH}"
COMPATIBLE_MACHINE = "(ls1012a)"
