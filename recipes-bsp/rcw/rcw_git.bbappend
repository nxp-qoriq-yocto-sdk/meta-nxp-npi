EXTRA_OEMAKE = "BOARDS=${@d.getVar('MACHINE', True).replace('-64b','').replace('-32b','').replace('-${SITEINFO_ENDIANNESS}','')} DESTDIR=${D}/boot/rcw/"

SRCREV = "3252b8cce8e5a214c8e652121ef9b9460663c65a"

do_install_append () {
     for f_swap in `find ${D}/boot/rcw/ -name "*qspiboot_swap*"`;do
         f=`echo $f_swap |sed -e 's/qspiboot_swap/qspiboot/'`
         if echo $f |grep -q "qspiboot_sben";then
             rm -f $f_swap
         else
             mv -f $f_swap $f
         fi
     done
}
