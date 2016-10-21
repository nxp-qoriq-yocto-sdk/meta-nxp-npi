EXTRA_OEMAKE = "BOARDS=${@d.getVar('MACHINE', True).replace('-64b','').replace('-32b','').replace('-${SITEINFO_ENDIANNESS}','')} DESTDIR=${D}/boot/rcw/"

SRC_URI = "git://sw-stash.freescale.net/scm/sdk/rcw.git;branch=master;protocol=http"
SRCREV = "8411b787a8057388f7c28a42f2f963d1a24ac44b"
