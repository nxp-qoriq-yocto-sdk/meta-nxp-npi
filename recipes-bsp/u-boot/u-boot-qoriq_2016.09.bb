require recipes-bsp/u-boot/u-boot-qoriq_2016.01.bb

python () {
    ml = d.getVar("MULTILIB_VARIANTS", True)
    arch = d.getVar("OVERRIDES", True)
    if "ls1046a-32b:" in arch or "ls1043a-32b:" in arch:
        if not "lib64" in ml:
            raise bb.parse.SkipPackage("Building the u-boot for this arch requires multilib to be enabled")
        sys_multilib = 'aarch64' + d.getVar('TARGET_VENDOR') + 'mllib64-linux'
        d.setVar('DEPENDS_append', ' lib64-gcc-cross-aarch64 lib64-libgcc')
        d.setVar('PATH_append', ':' + d.getVar('STAGING_BINDIR_NATIVE') + '/' + sys_multilib)
        d.setVar('TOOLCHAIN_OPTIONS_append', '/../lib64-' + d.getVar("MACHINE"))
        d.setVar("WRAP_TARGET_PREFIX", sys_multilib + '-')
}

SRC_URI = "git://sw-stash.freescale.net/scm/sdk/u-boot-sdk.git;branch=master;protocol=http"
SRCREV = "a2975e0ed02df7d556dbb0c7842ed333145254b7"
