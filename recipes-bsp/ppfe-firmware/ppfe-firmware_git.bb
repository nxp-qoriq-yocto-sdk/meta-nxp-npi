DESCRIPTION = "PPFE Linux firmware"
LICENSE = "Freescale-Binary-EULA"
LIC_FILES_CHKSUM = "file://Freescale-Binary-EULA;md5=f1c407c0fccab5cd0bf9b92565f6f19b"

INHIBIT_DEFAULT_DEPS = "1"

SRC_URI = "git://sw-stash.freescale.net/scm/dncpe/engine-pfe-bin.git;branch=master;protocol=http"
SRCREV = "5d984557d9b542bdd8bd469537126c05dd167dcc"

S = "${WORKDIR}/git"

do_install () {
    install -d ${D}/lib/firmware
    install -m 644 ${S}/Freescale-Binary-EULA ${D}/lib/firmware
    install -m 755 ${S}/ls1012a/slow_path/*.elf ${D}/lib/firmware
}

FILES_${PN} += "/lib/firmware"
INSANE_SKIP_${PN} += "arch already-stripped"
INHIBIT_PACKAGE_STRIP = "1"
INHIBIT_SYSROOT_STRIP = "1"

COMPATIBLE_MACHINE = "(ls1012a)"
