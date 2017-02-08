SUMMARY = "Linux SA trace component"
LICENSE = "Freescale-EULA"
LIC_FILES_CHKSUM = "file://COPYING;md5=bf20d39b348e1b0ed964c91a97638bbb"

INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

SRCBRANCH = "satrace_gcc4.9"
SRC_URI = "git://sw-stash.freescale.net/scm/dsa/sdk_components.git;branch=${SRCBRANCH};protocol=http"
SRCREV="32dcbde92dbff750f7aa59d41f3dd3092f368213"

S = "${WORKDIR}/git"

do_install() {
        oe_runmake install DESTDIR=${D}/${libdir}
        rm ${D}/${libdir}/COPYING
        rm ${D}/${libdir}/README
}

FILES_${PN}-dev += "${libdir}/linux.armv8.satrace \
  ${libdir}/linux.armv8.debugprint"


ALLOW_EMPTY_${PN} = "1"
COMPATIBLE_MACHINE = "(fsl-lsch2|fsl-lsch3)"
