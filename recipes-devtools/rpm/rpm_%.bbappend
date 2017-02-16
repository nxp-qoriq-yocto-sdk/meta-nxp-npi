do_compile_prepend_class-target() {
    if [ "${base_libdir}" != "/lib" ]; then
        cd ${STAGING_EXECPREFIXDIR}
        ln -sf lib64 lib
    fi
}

do_install_append_class-target() {
    if [ "${base_libdir}" != "/lib" ]; then
        cd ${STAGING_EXECPREFIXDIR}
        rm lib
    fi
}
