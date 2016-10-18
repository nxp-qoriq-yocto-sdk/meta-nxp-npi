SRC_URI = "git://sw-stash.freescale.net/scm/sdk/cst.git;branch=master;protocol=http"
SRCREV = "67ee75303916fc60dfd68ba1920932f57a8b9e94"

inherit deploy

do_deploy () {
    :
}
do_deploy_class-native () {
    install -d ${DEPLOYDIR}
    cp -prf ${STAGING_BINDIR_NATIVE}/cst ${DEPLOYDIR}/
}
addtask deploy before do_build after do_populate_sysroot

