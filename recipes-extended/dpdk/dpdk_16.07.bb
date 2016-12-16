DESCRIPTION = "Data Plane Development Kit"
HOMEPAGE = "http://dpdk.org"
LICENSE = "BSD & LGPLv2 & GPLv2"
LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=751419260aa954499f7abaabaa882bbe"

DEPENDS += "virtual/kernel openssl"
RDEPENDS_${PN} = "bash python"
RDEPENDS_${PN}-examples = "bash python-core"

SRC_URI = "git://sw-stash.freescale.net/scm/gitam/dpdk.git;branch=16.07-qoriq;protocol=http"
SRCREV = "4b7abe6b9ce0b860d207e54820ab411e816c03ea"

S = "${WORKDIR}/git"

export DPAA_VER = "dpaa2"
export RTE_TARGET = "arm64-${DPAA_VER}-linuxapp-gcc"

EXTRA_OEMAKE += 'ARCH="arm64" CROSS="${TARGET_PREFIX}" \
    CPU_CFLAGS="--sysroot=${STAGING_DIR_HOST}" RTE_SDK="${S}" \
    OPENSSL_PATH="${STAGING_DIR_HOST}" RTE_KERNELDIR="${STAGING_KERNEL_DIR}" \
    RTE_KERNELDIR_OUT="${STAGING_KERNEL_BUILDDIR}" \
'

do_configure[noexec] = "1"

do_compile[depends] += "virtual/kernel:do_shared_workdir"
do_compile() {
    oe_runmake O="${RTE_TARGET}" T="${RTE_TARGET}" config
}

do_install() {
    unset LDFLAGS TARGET_LDFLAGS BUILD_LDFLAGS

    oe_runmake T="${RTE_TARGET}" DESTDIR="${D}" install

    # Build and install the DPDK examples
    for APP in examples/l2fwd examples/l3fwd examples/l2fwd-crypto examples/ipsec-secgw; do
        oe_runmake -C ${APP}

        [ ! -d ${D}/${bindir}/dpdk-example ] && install -d 0644 ${D}/${bindir}/dpdk-example
        install -m 0755 ${S}/examples/`basename ${APP}`/build/`basename ${APP}` \
            ${D}/${bindir}/dpdk-example/
    done
    install -m 0755 ${S}/${RTE_TARGET}/app/testpmd ${D}/${bindir}/dpdk-example/

    sed -i 's#/bin/echo#/bin/bash#' ${D}/${datadir}/scripts/load-devel-config.sh
   # rm ${S}/${RTE_TARGET}/app/dpdk-pmdinfogen
    rm ${D}/${datadir}/${RTE_TARGET}/app/dpdk-pmdinfogen

    chown root:root -R ${D}
}

PACKAGE_ARCH = "${MACHINE_ARCH}"

PACKAGES += "${PN}-examples"

FILES_${PN} += "${datadir}/tools"
FILES_${PN}-dbg += "${bindir}/dpdk-example/.debug \
    ${datadir}/examples/kni/build/.debug \
    ${datadir}/examples/kni/build/app/.debug \
    ${datadir}/examples/l2fwd/build/.debug \
    ${datadir}/examples/l2fwd/build/app/.debug \
    ${datadir}/examples/l2fwd-crypto/build/.debug \
    ${datadir}/examples/l2fwd-crypto/build/app/.debug \
    ${datadir}/examples/l3fwd/build/.debug \
    ${datadir}/examples/l3fwd/build/app/.debug \
    ${datadir}/examples/ipsec-secgw/build/.debug \
    ${datadir}/examples/ipsec-secgw/build/app/.debug \
"
FILES_${PN}-dev += "${datadir}/mk ${datadir}/scripts \
    ${datadir}/arm64-dpaa2-linuxapp-gcc \
    ${includedir} \
"
FILES_${PN}-examples += "${datadir}/examples"

COMPATIBLE_MACHINE = "(ls2080ardb|ls2084ardb|ls2088a|ls1043a|ls1046a)"
