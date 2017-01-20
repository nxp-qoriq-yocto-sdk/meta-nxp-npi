REGLEX_ls1046a = "t2080"
REGLEX_ls1043a = "t2080"

do_install_append_ls1043a () {
  if [ -e ${D}/boot/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ];then
    mv ${D}/boot/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ${D}/boot/fsl_fman_ucode_ls1043_r1.1_108_4_5.bin
  fi
  if [ -e ${D}/boot/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ];then
    mv ${D}/boot/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ${D}/boot/fsl_fman_ucode_ls1043_r1.1_106_4_18.bin
  fi
}

do_install_append_ls1043ardb () {
  if [ -e ${D}/boot/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ];then
    mv ${D}/boot/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ${D}/boot/fsl_fman_ucode_ls1043_r1.1_108_4_5.bin
  fi
  if [ -e ${D}/boot/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ];then
    mv ${D}/boot/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ${D}/boot/fsl_fman_ucode_ls1043_r1.1_106_4_18.bin
  fi
}

do_install_append_ls1046a () {
  if [ -e ${D}/boot/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ];then
    mv ${D}/boot/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ${D}/boot/fsl_fman_ucode_ls1046_r1.0_108_4_5.bin
  fi
  if [ -e ${D}/boot/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ];then
    mv ${D}/boot/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ${D}/boot/fsl_fman_ucode_ls1046_r1.0_106_4_18.bin
  fi
}

do_deploy_append_ls1043a () {
  if [ -e ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ];then
    mv ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ${DEPLOYDIR}/fsl_fman_ucode_ls1043_r1.1_108_4_5.bin
  fi
  if [ -e ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ];then
    mv ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ${DEPLOYDIR}/fsl_fman_ucode_ls1043_r1.1_106_4_18.bin
  fi
}

do_deploy_append_ls1043ardb () {
  if [ -e ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ];then
    mv ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ${DEPLOYDIR}/fsl_fman_ucode_ls1043_r1.1_108_4_5.bin
  fi
  if [ -e ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ];then
    mv ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ${DEPLOYDIR}/fsl_fman_ucode_ls1043_r1.1_106_4_18.bin
  fi
}

do_deploy_append_ls1046a () {
  if [ -e ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ];then
    mv ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_108_4_5.bin ${DEPLOYDIR}/fsl_fman_ucode_ls1046_r1.0_108_4_5.bin
  fi
  if [ -e ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ];then
    mv ${DEPLOYDIR}/fsl_fman_ucode_t2080_r1.1_106_4_18.bin ${DEPLOYDIR}/fsl_fman_ucode_ls1046_r1.0_106_4_18.bin
  fi
}

