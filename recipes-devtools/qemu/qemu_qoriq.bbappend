# This means QEMU v2.6.2 with FSL specific patches applied
PV = "2.6.2+fsl"

PACKAGECONFIG[vnc-tls] = ""
PACKAGECONFIG[nss] = "--enable-smartcard,--disable-smartcard,nss,"
PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,gcrypt,"
PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"

SRC_URI = "git://sw-stash.freescale.net/scm/sdk/qemu.git;branch=qemu-2.6;protocol=http"
SRCREV = "ef54fffcee4324c9a32bf6e260c8141b4e6c542e"

QEMU_TARGETS_ls1012a-32b = "arm"
QEMU_TARGETS_ls1043a-32b = "arm"
QEMU_TARGETS_ls1046a-32b = "arm"
