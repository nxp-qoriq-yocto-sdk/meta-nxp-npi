require recipes-dpaa2/mc/management-complex_0.8.4.bb

SRC_URI = "git://sw-stash.freescale.net/scm/dpaa2/mc-binary.git;branch=master;protocol=http"
SRCREV = "43c7dc6a864ee60adad46cb7b0de7ca8c4008d6e"

COMPATIBLE_MACHINE = "(ls2080a|ls2088a)"
