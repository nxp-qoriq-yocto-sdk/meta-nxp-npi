FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_ls1046a = " file://74-ls1046a-xfi2-networking.rules"

do_install_append_ls1046a () {
    install -m 0644 ${WORKDIR}/74-ls1046a-xfi2-networking.rules ${D}${sysconfdir}/udev/rules.d/
}
