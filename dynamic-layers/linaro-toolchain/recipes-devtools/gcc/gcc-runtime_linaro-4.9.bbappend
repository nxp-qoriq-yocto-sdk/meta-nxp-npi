inherit gcc-aarch64-multilib

do_install () {
        target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
        for d in ${RUNTIMETARGET}; do
                cd ${B}/$target/$d/
                oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/$d/ MULTIOSSUBDIR= install
        done
        rm -rf ${D}${infodir}/libgomp.info ${D}${infodir}/dir
        rm -rf ${D}${infodir}/libquadmath.info ${D}${infodir}/dir
        if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude ]; then
                rmdir --ignore-fail-on-non-empty -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude
        fi
        if [ -d ${D}${infodir} ]; then
                rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
        fi
        if [ "${TARGET_VENDOR_MULTILIB_ORIGINAL}" != "" -a "${TARGET_VENDOR}" != "${TARGET_VENDOR_MULTILIB_ORIGINAL}" ]; then
                ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR_MULTILIB_ORIGINAL}-${TARGET_OS}
        fi
        if [ "${TARGET_OS}" = "linux-gnuspe" ]; then
                ln -s ${TARGET_SYS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-linux
        fi
        if [ -e "${D}/${exec_prefix}/lib" ] && [ "${exec_prefix}/lib" != "${libdir}" ]; then
                install -d ${D}/${libdir}
                cp -rf ${D}/${exec_prefix}/lib/* ${D}/${libdir}/
                rm -rf ${D}/${exec_prefix}/lib
        fi
        chown -R root:root ${D}
}

