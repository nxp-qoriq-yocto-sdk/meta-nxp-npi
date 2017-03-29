SRC_URI = "git://git.freescale.com/ppc/sdk/ls2-rcw.git;nobranch=1"
SRCREV = "5d4624f74ad2744160060a006b7b5a6359d69142"

inherit siteinfo

M="${@d.getVar('MACHINE', True).replace('-64b','').replace('-32b','').replace('-${SITEINFO_ENDIANNESS}','')}"

do_install () {
    install -d ${D}/boot/rcw
    cp -a ${S}/${M} ${D}/boot/rcw/
    chown -R root:root ${D}/boot/rcw/
}

do_deploy () {
    install -d ${DEPLOYDIR}/rcw
    cp -a ${S}/${M} ${DEPLOYDIR}/rcw/
}

COMPATIBLE_MACHINE = "(ls1012a|ls2080a|ls2088a)"
