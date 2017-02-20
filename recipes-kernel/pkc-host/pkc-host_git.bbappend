# remove c29x_pkc DISTRO_FEATURE
REQUIRED_DISTRO_FEATURES = ""
# Cryptodev is not necessary for pkc-host to function
RDEPENDS_${PN}_remove = "cryptodev-module"

SRC_URI = "git://sw-stash.freescale.net/scm/sdk/pkc-host.git;branch=master;protocol=http"
SRCREV = "0624112095526c666e689e63924683a7e64dace2"

do_install() {
    oe_runmake INSTALL_MOD_PATH="${D}" modules_install
    install -d ${D}/etc/crypto
    install -d ${D}/${bindir}
    cp ${S}/images/pkc-firmware.bin ${D}/etc/crypto
    cp ${S}/perf/c29x_driver_perf_profile.sh ${D}/${bindir}
}

FILES_${PN} = " ${bindir}/c29x_driver_perf_profile.sh \
    /etc/crypto/pkc-firmware.bin \
"
