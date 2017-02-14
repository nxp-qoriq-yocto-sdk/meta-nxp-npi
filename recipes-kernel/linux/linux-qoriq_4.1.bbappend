SRC_URI = "git://git.freescale.com/ppc/sdk/linux.git;nobranch=1"
SRCREV = "a670e823f6fda8f5cac8263a78a2c50ed7ba0009"

DELTA_KERNEL_DEFCONFIG_prepend_ls1012a-32b = "freescale_aarch32.config "
DELTA_KERNEL_DEFCONFIG_prepend_ls1043a-32b = "freescale_aarch32.config "
DELTA_KERNEL_DEFCONFIG_prepend_ls1046a-32b = "freescale_aarch32.config "

do_compile_prepend_ls1012a-32b() {
    ln -sfT ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/freescale ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}
do_compile_prepend_ls1043a-32b() {
    ln -sfT ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/freescale ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}
do_compile_prepend_ls1046a-32b() {
    ln -sfT ${STAGING_KERNEL_DIR}/arch/arm64/boot/dts/freescale ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}

do_install_prepend_ls1012a-32b() {
    rm -f ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}
do_install_prepend_ls1043a-32b() {
    rm -f ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}
do_install_prepend_ls1046a-32b() {
    rm -f ${STAGING_KERNEL_DIR}/arch/arm/boot/dts/freescale
}
