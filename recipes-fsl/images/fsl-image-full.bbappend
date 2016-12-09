IMAGE_INSTALL_append_ls1012a = " \
    packagegroup-fsl-multimedia-gstreamer1.0-core \
"

inherit disable-services
ROOTFS_POSTPROCESS_COMMAND_append_ls1012a = "rootfs_disable_unnecessary_services;"
