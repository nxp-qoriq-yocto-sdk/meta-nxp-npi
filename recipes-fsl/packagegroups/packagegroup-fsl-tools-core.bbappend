RDEPENDS_${PN}_append_qoriq = " gptfdisk"
RDEPENDS_${PN}_append_ls1012a = " hostapd ppfe-firmware"

DPAA_PKGS_ls1043a-32b ="eth-config fmc"
DPAA_PKGS_ls1046a-32b ="eth-config fmc"
DPAA_PKGS_ls1012a = ""

RDEPENDS_${PN}_append_qoriq = " pciutils pkc-host"
RDEPENDS_${PN}_append_ls1043ardb = " \
    dpdk \
    dpdk-extras \
"
RDEPENDS_${PN}_append_ls1046ardb = " \
    dpdk \
    dpdk-extras \
"
RDEPENDS_${PN}_append_ls2080ardb = " \
    dpdk \
    dpdk-extras \
    odp \
"
RDEPENDS_${PN}_append_ls2088a = " \
    aiopsl \
    dce \
    devmem2 \
    dpdk \
    dpdk-extras \
    gpp-aioptool \
    odp \
    ofp \
    scatter-gather \
"

