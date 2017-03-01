SCMVERSION = ""

SRC_URI = "git://sw-stash.freescale.net/scm/sdk/linux-sdk2.0.git;branch=yocto/sdk-2.0.x;protocol=http"
SRCREV = "fcd7a05fdfeebddb19bf72621c4c818900ab2896"

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
