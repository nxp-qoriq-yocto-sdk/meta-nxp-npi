EXTRA_OEMAKE = "BOARDS=${@d.getVar('MACHINE', True).replace('-64b','').replace('-32b','').replace('-${SITEINFO_ENDIANNESS}','')} DESTDIR=${D}/boot/rcw/"

SRC_URI = "git://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/rcw.git;nobranch=1;protocol=http"
SRCREV = "7bd43d920065171a8d805a3d02fa4c0b39885664"

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
