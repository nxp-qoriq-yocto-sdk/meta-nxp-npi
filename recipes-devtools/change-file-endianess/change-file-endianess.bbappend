FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

inherit deploy

do_deploy () {
    :
}
do_deploy_class-native () {
    install -d ${DEPLOYDIR}
    cp -f ${STAGING_BINDIR_NATIVE}/byte_swap.tcl ${DEPLOYDIR}/
}
addtask deploy before do_build after do_populate_sysroot

