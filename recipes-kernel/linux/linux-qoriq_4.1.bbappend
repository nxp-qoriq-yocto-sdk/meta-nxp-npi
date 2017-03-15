SCMVERSION = ""

SRC_URI = "git://sw-stash.freescale.net/scm/sdk/linux-sdk2.0.git;branch=yocto/sdk-2.0.x;protocol=http"
SRCREV = "2421cc2e296726400de82bf3b910b4bfb2549413"

DELTA_KERNEL_DEFCONFIG_prepend_ls1012a-32b = "freescale_aarch32.config "
DELTA_KERNEL_DEFCONFIG_prepend_ls1043a-32b = "freescale_aarch32.config "
DELTA_KERNEL_DEFCONFIG_prepend_ls1046a-32b = "freescale_aarch32.config "

python do_symlink_kernel_source() {
    s = d.getVar("S", True)
    if s[-1] == '/':
        # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
        s=s[:-1]
    kernsrc = d.getVar("STAGING_KERNEL_DIR", True)
    if s != kernsrc:
        bb.utils.mkdirhier(kernsrc)
        bb.utils.remove(kernsrc, recurse=True)
        os.symlink(s, kernsrc)
}
addtask symlink_kernel_source before do_configure

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
