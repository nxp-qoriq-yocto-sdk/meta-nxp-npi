IMAGE_INSTALL_append_ls1012a = " packagegroup-fsl-tools-audio"

inherit disable-services
ROOTFS_POSTPROCESS_COMMAND_append_ls1012a = "rootfs_disable_unnecessary_services;"
