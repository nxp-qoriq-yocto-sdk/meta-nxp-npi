LIC_FILES_CHKSUM = "file://ppa/EULA.txt;md5=60037ccba533a5995e8d1a838d85799c"

DEPENDS += "change-file-endianess-native"

SRC_URI = "git://sw-stash.freescale.net/scm/dnnpi/ppa-generic.git;branch=master;protocol=http"
SRCREV = "cb683b7cab76f2d685f54393d3b51dd1d02dac9d"

PPA_PATH ?= "ppa/soc-ls1043/platform-rdb"
PPA_PATH_ls1046a = "ppa/soc-ls1046/platform-rdb"
PPA_SWAP ?= ""
PPA_SWAP_ls1046a = "1"
PPA_NAME ?= "ppa-${MACHINE}-${DATETIME}"
PPA_NAME[vardepsexclude] = "DATETIME"

do_compile() {
    export ARMV8_TOOLS_DIR="${STAGING_BINDIR_TOOLCHAIN}"
    export ARMV8_TOOLS_PREFIX="${TARGET_PREFIX}"
    export CROSS_COMPILE="${WRAP_TARGET_PREFIX}"
    cd ${S}/${PPA_PATH}
    oe_runmake rdb-fit
    if [ -n "${PPA_SWAP}" ];then
        tclsh ${STAGING_BINDIR_NATIVE}/byte_swap.tcl build/obj/ppa.itb build/obj/ppa-swap.itb 8
    fi
    cd ${S}
}

do_install() {
    install -d ${D}/boot/
    install ${S}/${PPA_PATH}/build/obj/ppa.itb ${D}/boot/${PPA_NAME}.itb
    ln -sfT ${PPA_NAME}.itb ${D}/boot/ppa.itb
    if [ -n "${PPA_SWAP}" ];then
        install ${S}/${PPA_PATH}/build/obj/ppa-swap.itb ${D}/boot/${PPA_NAME}.itb
    fi
}

do_deploy(){
    install -d ${DEPLOYDIR}
    install ${S}/${PPA_PATH}/build/obj/ppa.itb ${DEPLOYDIR}/${PPA_NAME}.itb
    ln -sfT ${PPA_NAME}.itb ${DEPLOYDIR}/ppa.itb
    if [ -n "${PPA_SWAP}" ];then
        install ${S}/${PPA_PATH}/build/obj/ppa-swap.itb ${DEPLOYDIR}/${PPA_NAME}.itb
    fi
}

CLEANBROKEN = "1"
PARALLEL_MAKE = ""
COMPATIBLE_MACHINE = "(ls1043a|ls1046a)"
