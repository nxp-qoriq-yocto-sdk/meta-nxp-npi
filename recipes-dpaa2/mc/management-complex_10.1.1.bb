require recipes-dpaa2/mc/management-complex_0.8.4.bb

SRC_URI = "git://sw-stash.freescale.net/scm/dpaa2/mc-binary.git;branch=master;protocol=http"
SRCREV = "5aafd4d5a572158b82810bc6e6d7fb2bf08446a5"

COMPATIBLE_MACHINE = "(ls2080a|ls2088a)"
