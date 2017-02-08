CFLAGS_append_ls2088a = " -fPIC"

do_install_append_ls2088a() {
	install -d ${D}${includedir}/openvswitch/
	cp -r ${S}/lib/*.h ${D}${includedir}/openvswitch
	install -d ${D}${includedir}/openvswitch/openvswitch/
	cp -r ${S}/include/openvswitch/*.h ${D}${includedir}/openvswitch/openvswitch
}
