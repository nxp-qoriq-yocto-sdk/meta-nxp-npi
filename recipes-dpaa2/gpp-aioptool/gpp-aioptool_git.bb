DESCRIPTION = "AIOP Tool is a userspace application for performing operations \
on an AIOP Tile using MC interfaces. This application enables the user to \
fetch status of tile, load a valid ELF file and run it on a tile and get and set \
time of day."
SECTION = "dpaa2"
LICENSE = "Freescale-EULA"
LIC_FILES_CHKSUM = "file://Freescale-EULA;md5=395c11b7d81446eaa8f997521afe0ebb"

SRC_URI = "git://sw-stash.freescale.net/scm/dpaa2/gpp-aioptool.git;branch=master;protocol=http"
SRCREV = "77adf344d322f8ff5e383cfd6decda1fa747c6f3"

S = "${WORKDIR}/git"

EXTRA_OEMAKE = 'KERNEL_PATH="${STAGING_KERNEL_DIR}"'

do_configure[depends] += "virtual/kernel:do_shared_workdir"

do_install () {
    oe_runmake install DESTDIR=${D}
}

COMPATIBLE_MACHINE = "(ls2088a)"