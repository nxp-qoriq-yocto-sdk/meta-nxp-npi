SRC_URI = "git://sw-stash.freescale.net/scm/dpaa2/ls2-rcw.git;branch=master;protocol=http"
SRCREV = "900340e911f9386e1285e123fd499f82e857d05c"

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
