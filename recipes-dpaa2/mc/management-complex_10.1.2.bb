require recipes-dpaa2/mc/management-complex_0.8.4.bb

SRC_URI = "git://git.freescale.com/ppc/sdk/mc-binary.git;nobranch=1"
SRCREV = "10db0dfa51c8aa6308d7986355bb8b1a3a34d298"

LIC_FILES_CHKSUM = "file://LICENSE;md5=0ef9ba7621bd36f5fef5009fbeb56b00"

COMPATIBLE_MACHINE = "(ls2080a|ls2088a)"
