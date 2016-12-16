# This means QEMU v2.6.2 with FSL specific patches applied
PV = "2.6.2+fsl"

PACKAGECONFIG[vnc-tls] = ""
PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,gcrypt,"
PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"

SRC_URI = "git://sw-stash.freescale.net/scm/sdk/qemu.git;branch=qemu-2.6;protocol=http"
SRCREV = "529d45e151d82a772cd9b9af64bb25f88fba6567"

QEMU_TARGETS_ls1012a-32b = "arm"
QEMU_TARGETS_ls1043a-32b = "arm"
QEMU_TARGETS_ls1046a-32b = "arm"
