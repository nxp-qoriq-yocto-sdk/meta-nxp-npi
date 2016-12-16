RDEPENDS_${PN}_append = " gptfdisk"
RDEPENDS_${PN}_append_ls1012a = " hostapd ppfe-firmware"

DPAA_PKGS_ls1043a-32b ="eth-config fmc"
DPAA_PKGS_ls1046a-32b ="eth-config fmc"
DPAA_PKGS_ls1012a = ""

RDEPENDS_${PN}_append_ls1043ardb = " \
    dpdk \
    dpdk-extras \
    pciutils \
"
RDEPENDS_${PN}_append_ls1046ardb = " \
    dpdk \
    dpdk-extras \
    pciutils \
"

