do_install () {
        target=`echo ${TARGET_SYS} | sed -e s#-${SDKPKGSUFFIX}##`
        cd ${B}/${BPN}
        oe_runmake 'DESTDIR=${D}' MULTIBUILDTOP=${B}/$target/${BPN}/ MULTIOSSUBDIR= install

        # Move libgcc_s into /lib
        mkdir -p ${D}${base_libdir}
        if [ -f ${D}${libdir}/nof/libgcc_s.so ]; then
                mv ${D}${libdir}/nof/libgcc* ${D}${base_libdir}
        else
                mv ${D}${libdir}/libgcc* ${D}${base_libdir} || true
        fi

        # install the runtime in /usr/lib/ not in /usr/lib/gcc on target
        # so that cross-gcc can find it in the sysroot

        mv ${D}${libdir}/gcc/* ${D}${libdir}
        rm -rf ${D}${libdir}/gcc/
        # unwind.h is installed here which is shipped in gcc-cross
        # as well as target gcc and they are identical so we dont
        # ship one with libgcc here
        rm -rf ${D}${libdir}/${TARGET_SYS}/${BINV}/include
}

