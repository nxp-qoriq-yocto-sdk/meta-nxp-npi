python () {
    ml = d.getVar("MULTILIB_VARIANTS", True)
    arch = d.getVar("OVERRIDES", True)
    if "ls1012a-32b:" in arch or "ls1046a-32b:" in arch or "ls1043a-32b:" in arch:
        if not "lib64" in ml:
            raise bb.parse.SkipPackage("Building the u-boot for this arch requires multilib to be enabled")
        sys_multilib = 'aarch64' + d.getVar('TARGET_VENDOR') + 'mllib64-linux'
        d.setVar('DEPENDS_append', ' lib64-gcc-cross-aarch64 lib64-libgcc')
        d.setVar('PATH_append', ':' + d.getVar('STAGING_BINDIR_NATIVE') + '/' + sys_multilib)
        d.setVar('TOOLCHAIN_OPTIONS_append', '/../lib64-' + d.getVar("MACHINE"))
        d.setVar("WRAP_TARGET_PREFIX", sys_multilib + '-')
}

LIC_FILES_CHKSUM = "file://ppa/EULA.txt;md5=60037ccba533a5995e8d1a838d85799c"

SRC_URI = "git://git.freescale.com/ppc/sdk/ppa-generic.git;nobranch=1"
SRCREV = "e77d7e471e1e61ebb682506c29462c97c959f7da"

WRAP_TARGET_PREFIX ?= "${TARGET_PREFIX}"
EXTRA_OEMAKE = 'CC64="${WRAP_TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" LD64="${WRAP_TARGET_PREFIX}ld ${TOOLCHAIN_OPTIONS}"  OBJ64="${WRAP_TARGET_PREFIX}objcopy"'

PPA_PATH ?= "ppa/soc-ls1043/platform-rdb"
PPA_PATH_ls1046a = "ppa/soc-ls1046/platform-rdb"
PPA_PATH_ls1012a = "ppa/soc-ls1012/platform-rdb"
PPA_PATH_ls2088a = "ppa/soc-ls2088/platform-rdb"
PPA_NAME ?= "ppa-${MACHINE}-${DATETIME}"
PPA_NAME[vardepsexclude] = "DATETIME"

do_compile() {
    export ARMV8_TOOLS_DIR="${STAGING_BINDIR_TOOLCHAIN}"
    export ARMV8_TOOLS_PREFIX="${TARGET_PREFIX}"
    export CROSS_COMPILE="${WRAP_TARGET_PREFIX}"
    cd ${S}/${PPA_PATH}
    oe_runmake rdb-fit
    cd ${S}
}

do_install() {
    install -d ${D}/boot/
    install ${S}/${PPA_PATH}/build/obj/ppa.itb ${D}/boot/${PPA_NAME}.itb
    ln -sfT ${PPA_NAME}.itb ${D}/boot/ppa.itb
}

do_deploy(){
    install -d ${DEPLOYDIR}
    install ${S}/${PPA_PATH}/build/obj/ppa.itb ${DEPLOYDIR}/${PPA_NAME}.itb
    ln -sfT ${PPA_NAME}.itb ${DEPLOYDIR}/ppa.itb
}

CLEANBROKEN = "1"
PARALLEL_MAKE = ""
COMPATIBLE_MACHINE = "(ls1012a|ls1043a|ls1046a|ls2088a)"
