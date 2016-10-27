EXTRA_OEMAKE = "BOARDS=${@d.getVar('MACHINE', True).replace('-64b','').replace('-32b','').replace('-${SITEINFO_ENDIANNESS}','')} DESTDIR=${D}/boot/rcw/"

SRC_URI = "git://sw-stash.freescale.net/scm/sdk/rcw.git;branch=master;protocol=http"
SRCREV = "7304127dd3fab88d2bec846b489e70eaaaefc983"
