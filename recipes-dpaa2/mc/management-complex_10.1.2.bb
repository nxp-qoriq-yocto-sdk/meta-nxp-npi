require recipes-dpaa2/mc/management-complex_0.8.4.bb

SRC_URI = "git://sw-stash.freescale.net/scm/dpaa2/mc-binary.git;branch=master;protocol=http"
SRCREV = "a3d4fe921117970bd876c365fe03bd1dc4fa01ea"

COMPATIBLE_MACHINE = "(ls2080a|ls2088a)"
