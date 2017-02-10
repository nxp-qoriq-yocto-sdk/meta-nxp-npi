SUMMARY = "Open Data Plane Interface Implementation"
DESCRIPTION = "OpenDataPlane (ODP) provides a data plane application programming \
        environment that is easy to use, high performance, and portable between networking SoCs."
HOMEPAGE = "http://www.opendataplane.org"
SECTION = "console/network"
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://LICENSE;md5=4ccfa994aa96974cfcd39a59faee20a2"

SRC_URI = " \
git://sw-stash.freescale.net/scm/gitam/odp.git;branch=fsl_odp_v16.07_qoriq;protocol=http \
git://sw-stash.freescale.net/scm/dpaa2/qbman_userspace.git;protocol=http;name=qbman;destsuffix=git/platform/linux-dpaa2/flib/qbman \
git://sw-stash.freescale.net/scm/sdk/flib.git;protocol=http;name=rta;destsuffix=git/platform/linux-dpaa2/flib/rta \
"
SRCREV = "6312aa729548b428ba27e1afab0018f1aed06ff1"
SRCREV_qbman = "0b8648d702f701417cd6cc3cbcdc228e640d20b6"
SRCREV_rta = "bbab28b03ae21c52ce913f8b052acf53bd24ff5d"

S = "${WORKDIR}/git"
