SRC_URI = "git://sw-stash.freescale.net/scm/sdk/linux-sdk2.0.git;branch=yocto/sdk-2.0.x;protocol=http"
SRCREV = "4004071c129a776136e71f6a85383fea87f5db75"

do_compile_prepend_ls1043a-32b() {
    ln -sfT ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/freescale ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}
do_compile_prepend_ls1046a-32b() {
    ln -sfT ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/freescale ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}

do_install_prepend_ls1043a-32b() {
    rm -f ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}
do_install_prepend_ls1046a-32b() {
    rm -f ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}
