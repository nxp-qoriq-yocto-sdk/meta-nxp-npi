FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

KERNEL_IMAGE_ls1043a-32b = "zImage"
KERNEL_IMAGE_ls1046a-32b = "zImage"
KERNEL_ITS_ls1043a-32b = "kernel-aarch32.its"
KERNEL_ITS_ls1046a-32b = "kernel-aarch32.its"

do_deploy_ls1043a-32b () {
    install -d ${DEPLOYDIR}
    cp ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE} .
    for DTS_FILE in ${KERNEL_DEVICETREE}; do
        DTB_FILE="${KERNEL_IMAGETYPE}-`basename ${DTS_FILE}`";
        ITB_BASENAME=kernel-`basename ${DTS_FILE} .dtb`-${DATETIME}
        ITB_SYMLINk=kernel-`basename ${DTS_FILE} .dtb`

        cp ${WORKDIR}/${KERNEL_ITS} kernel.its
        sed -i -e "s,kernel-image.gz,${KERNEL_IMAGE}," kernel.its
        sed -i -e "s,freescale.dtb,${DEPLOY_DIR_IMAGE}/${DTB_FILE}," kernel.its
        sed -i -e "s,rootfs.ext2.gz,${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ext2.gz," kernel.its

        mkimage -f kernel.its ${ITB_BASENAME}.itb

        install -m 644 ${ITB_BASENAME}.itb ${DEPLOYDIR}/
        ln -sf ${ITB_BASENAME}.itb ${DEPLOYDIR}/${ITB_SYMLINk}.itb
    done
}

do_deploy_ls1046a-32b () {
    install -d ${DEPLOYDIR}
    cp ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE} .
    for DTS_FILE in ${KERNEL_DEVICETREE}; do
        DTB_FILE="${KERNEL_IMAGETYPE}-`basename ${DTS_FILE}`";
        ITB_BASENAME=kernel-`basename ${DTS_FILE} .dtb`-${DATETIME}
        ITB_SYMLINk=kernel-`basename ${DTS_FILE} .dtb`

        cp ${WORKDIR}/${KERNEL_ITS} kernel.its
        sed -i -e "s,kernel-image.gz,${KERNEL_IMAGE}," kernel.its
        sed -i -e "s,freescale.dtb,${DEPLOY_DIR_IMAGE}/${DTB_FILE}," kernel.its
        sed -i -e "s,rootfs.ext2.gz,${DEPLOY_DIR_IMAGE}/${ROOTFS_IMAGE}-${MACHINE}.ext2.gz," kernel.its

        mkimage -f kernel.its ${ITB_BASENAME}.itb

        install -m 644 ${ITB_BASENAME}.itb ${DEPLOYDIR}/
        ln -sf ${ITB_BASENAME}.itb ${DEPLOYDIR}/${ITB_SYMLINk}.itb
    done
}

