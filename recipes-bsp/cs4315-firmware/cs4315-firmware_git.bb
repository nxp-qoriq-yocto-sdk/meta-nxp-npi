DESCRIPTION = "PHY Firmware images"
LICENSE = "Freescale-EULA"
LIC_FILES_CHKSUM = "file://cortina/EULA.txt;md5=86d76166990962fa552f840ff08e5798 \
    file://aquantia/EULA.txt;md5=86d76166990962fa552f840ff08e5798"

inherit deploy

SRC_URI = "git://github.com/nxp/qoriq-firmware-aquantia.git;nobranch=1;protocol=http;name=aquantia;destsuffix=git/aquantia \
    git://github.com/nxp/qoriq-firmware-cortina.git;nobranch=1;protocol=http;name=cortina;destsuffix=git/cortina"

SRCREV_FORMAT="aquantia"
SRCREV = "3b61b35ff379effca06ac001a4b7f779ebe943a6"
SRCREV_cortina = "9143c2a3adede595966583c00ca4edc99ec698cf"

S = "${WORKDIR}/git"

UCODE_t1023 = "aquantia/AQ28nm-FW_2.0.B3_Freescale_T1024RDB_120514.cld"
UCODE_t1024 = "aquantia/AQ28nm-FW_2.0.B3_Freescale_T1024RDB_120514.cld \
               aquantia/AQ28nm-FW_2.0.B9_Freescale_T1024RDB_012115.cld"
UCODE_t2080 = "cortina/cs4315-cs4340-PHY-ucode.txt \
               aquantia/Firmware_1.37.10_011014_Freescale_T2080PCIe.cld"
UCODE_t4240 = "cortina/cs4315-cs4340-PHY-ucode.txt"
UCODE_ls1046a = "\
    aquantia/aq_programming.bin \
    aquantia/AQR-G2_v3.1.5-AQR_RevB_AQR107_ID16068_VER385.cld \
"

do_install () {
    install -d ${D}/boot
    for name in ${UCODE};do
        install -m 644 ${S}/$name ${D}/boot/
    done
}

do_deploy () {
    install -d ${DEPLOYDIR}/
    for name in ${UCODE};do
        install -m 644 ${S}/$name ${DEPLOYDIR}/
    done
}
addtask deploy before do_build after do_install

PACKAGES += "${PN}-image"
FILES_${PN}-image += "/boot"
COMPATIBLE_MACHINE = "(t1023|t1024|t2080|t4240|ls1046a)"
