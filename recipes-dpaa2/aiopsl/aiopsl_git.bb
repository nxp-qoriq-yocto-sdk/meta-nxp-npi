DESCRIPTION = "DPAA2 Accelerated I/O Processing service layer"
SECTION = "dpaa2"
LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://src/include/common/fsl_stdio.h;beginline=2;endline=24;md5=ee87f38a0b9280575e834a11851d9bd3"

BASEDEPENDS = ""

S = "${WORKDIR}/git"

SRC_URI = "git://sw-stash.freescale.net/scm/dpaa2/aiopsl.git;branch=develop;protocol=http"
SRCREV = "3214345f4b524b07ffbfb947f5dad2ac4f675a7f"

do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install () {
    install -d ${D}/usr/aiop/bin
    install -d ${D}/usr/aiop/scripts
    install -d ${D}/usr/aiop/traffic_files
    install -m 755 ${S}/demos/images/LS2088A/*.elf ${D}/usr/aiop/bin
    install -m 755 ${S}/misc/setup/scripts/dynamic_aiop_*.sh ${D}/usr/aiop/scripts
    install -m 644 ${S}/misc/setup/traffic_files/classifier.pcap ${D}/usr/aiop/traffic_files
}

FILES_${PN} += "/usr/aiop/*"
INSANE_SKIP_${PN} += "arch"
INHIBIT_PACKAGE_STRIP = "1"
COMPATIBLE_MACHINE = "(ls2088a)"
