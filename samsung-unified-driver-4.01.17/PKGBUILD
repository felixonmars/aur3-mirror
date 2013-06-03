pkgname=samsung-unified-driver-4.01.17
pkgver=4.01.17
pkgrel=3

pkgdesc="Unified Linux Driver for Samsung printers and scanners."
arch=(i686 x86_64)
url="http://www.samsung.com"
license=('custom:samsung')
depends=('libjpeg6' 'libtiff3' 'cups' 'ghostscript' 'sane')
conflicts=('samsungmfp-configurator-qt4' 'samsung-unified-driver')
provides=('samsung-unified-driver')

options=(!strip)

source=("http://www.bchemnet.com/suldr/driver/UnifiedLinuxDriver-${pkgver}.tar.gz"
	'samsungUDC.desktop' 'smfpd.service')

sha1sums=(	'8ea926ea70286cb1f6183b4db7177ea7006f3510'
			'665ec70f99f5d76e7363c7c077debdba7dbb5d49'
			'c939905f1cd373e1267b64dea8c0c339d34a4862')

if [ "$CARCH" = "x86_64" ]; then
	CARCHCUSTOM="x86_64"
	LIBDIRCUSTOM="lib64"
else
	CARCHCUSTOM="i386"
	LIBDIRCUSTOM="lib"
fi

# helper function based on the function write_udev_rules_file from the samsung unified-driver install.sh script
write_udev_rules_file() {
	SUBNAME=$1
	RULES_FILE=$2

	echo "\# This file is a part of the archlinux package ${pkgname}" > $RULES_FILE
	echo "\# Rules to allow low level USB device access for smfpautoconf"  >> $RULES_FILE
	echo ''                                                               >> $RULES_FILE
	echo "SUBSYSTEM!=\"$SUBNAME\", GOTO=\"label_end\""                    >> $RULES_FILE
	echo 'ACTION!="add", GOTO="label_end"'                                >> $RULES_FILE
	echo '' >> $RULES_FILE
	echo '# usblp device files /dev/usb/lp*'  		      >> $RULES_FILE                                                               >> $RULES_FILE
	echo 'ATTRS{idVendor}=="0419", MODE="666", OWNER="root", GROUP="lp"'  >> $RULES_FILE
	echo 'ATTRS{idVendor}=="04e8", MODE="666", OWNER="root", GROUP="lp"'  >> $RULES_FILE
	echo 'ATTRS{idVendor}=="0924", MODE="666", OWNER="root", GROUP="lp"'  >> $RULES_FILE
	echo 'ATTRS{idVendor}=="413c", MODE="666", OWNER="root", GROUP="lp"'  >> $RULES_FILE
	echo '# libusb device files /dev/bus/usb/00*/*'  		      >> $RULES_FILE
	echo 'ATTRS{idVendor}=="0419", ENV{ID_USB_INTERFACES}=="*:0701*:", MODE="664", OWNER="root", GROUP="lp", ENV{libsane_matched}="yes"' >> $RULES_FILE
	echo 'ATTRS{idVendor}=="04e8", ENV{ID_USB_INTERFACES}=="*:0701*:", MODE="664", OWNER="root", GROUP="lp", ENV{libsane_matched}="yes"' >> $RULES_FILE
	echo 'ATTRS{idVendor}=="0924", ENV{ID_USB_INTERFACES}=="*:0701*:", MODE="664", OWNER="root", GROUP="lp", ENV{libsane_matched}="yes"' >> $RULES_FILE
	echo 'ATTRS{idVendor}=="413c", ENV{ID_USB_INTERFACES}=="*:0701*:", MODE="664", OWNER="root", GROUP="lp", ENV{libsane_matched}="yes"' >> $RULES_FILE
	echo ''                                                              >> $RULES_FILE
	echo 'LABEL="label_end"'                                             >> $RULES_FILE

	chmod 644 $RULES_FILE
}

package() {

# installation directories
	realmfpdir="/opt/smfp-common"
	mfpdir="${pkgdir}/${realmfpdir}"

# source directories
	archsrcdir="${srcdir}/cdroot/Linux/${CARCHCUSTOM}"
	noarchsrcdir="${srcdir}/cdroot/Linux/noarch"

# mpf
	install -d "${pkgdir}/usr/lib"
	install -d "${pkgdir}/usr/bin"

# udev rules
	UDEV_RULES_DIR="${pkgdir}/usr/lib/udev/rules.d"
	install -d "${UDEV_RULES_DIR}/"
	write_udev_rules_file usb_device ${UDEV_RULES_DIR}/60_smfpautoconf_samsung.rules
	write_udev_rules_file usb        ${UDEV_RULES_DIR}/61_smfpautoconf_samsung.rules

	install -m 755 "${archsrcdir}/at_root/usr/${LIBDIRCUSTOM}/libmfp.so.1.0.1" \
	"${pkgdir}/usr/lib/libmfp.so.1.0.1"
	install -m 755 "${archsrcdir}/at_root/opt/smfp-common/lib/libnetsnmp.so.10.0.2" \
	"${pkgdir}/usr/lib/libnetsnmp.so.10.0.2"
	
	install -d "${pkgdir}/usr/lib/systemd/system/"
	install -m 644 "${srcdir}/smfpd.service" "${pkgdir}/usr/lib/systemd/system/smfpd.service"

# cups
	cupsdir="${pkgdir}/usr/lib/cups"
	cupsfilterdir="${cupsdir}/filter"
	cupsbackenddir="${cupsdir}/backend"

	install -d "${cupsfilterdir}"
	install -d "${cupsbackenddir}"
	install -d "${pkgdir}/usr/share/cups/model/samsung/cms"

	install -m 444 -t "${pkgdir}/usr/share/cups/model/samsung/cms/" ${noarchsrcdir}/at_opt/share/ppd/cms/*

	install -m 644 -t "${pkgdir}/usr/share/cups/model/" ${noarchsrcdir}/at_opt/share/ppd/*.ppd
	find "${pkgdir}/usr/share/cups/model/" -name "*.ppd" | xargs gzip -9

	install -d "${mfpdir}/printer/lib/"
	install -m 755 "${archsrcdir}/libscmssc.so" "${mfpdir}/printer/lib/libscmssc.so"
	install -m 755 "${archsrcdir}/mfp" "${cupsbackenddir}/mfp"
	install -m 755 "${archsrcdir}/pstosecps" "${cupsfilterdir}/pstosecps"
	install -m 755 "${archsrcdir}/pstospl" "${cupsfilterdir}/pstospl"
	install -m 755 "${archsrcdir}/pstosplc" "${cupsfilterdir}/pstosplc"
	install -m 755 "${archsrcdir}/rastertospl" "${cupsfilterdir}/rastertospl"
	install -m 755 "${archsrcdir}/rastertosplc" "${cupsfilterdir}/rastertosplc"
	
	# create a symbolic link to simplify updates
	# TODO: check if this doesn't break anything
	cd ${cupsfilterdir}
	ln -s ./rastertospl ./rastertosamsungspl
	ln -s ./rastertosplc ./rastertosamsungsplc
	cd -

# sane
	install -d "${pkgdir}/usr/lib/sane/"
	install -d "${pkgdir}/etc/sane.d/dll.d"

	install -m 644 "${noarchsrcdir}/at_root/etc/sane.d/smfp.conf" "${pkgdir}/etc/sane.d/smfp.conf"

	install -m 755 "${archsrcdir}/at_root/usr/${LIBDIRCUSTOM}/sane/libsane-smfp.so.1.0.1" \
	"${pkgdir}/usr/lib/sane/libsane-smfp.so.1.0.1"

	install -d "${mfpdir}/bin/"
	install -m 755 "${archsrcdir}/at_opt/bin/netdiscovery" "${mfpdir}/bin/netdiscovery"
	install -m 755 "${archsrcdir}/at_opt/bin/gettext" "${mfpdir}/bin/gettext"

	install -d "${pkgdir}/usr/bin/"
	install -m 755 "${archsrcdir}/at_root/usr/sbin/smfpd" "${pkgdir}/usr/bin/smfpd"

	install -d "${mfpdir}/share/"
	install -m 644 "${srcdir}/cdroot/Linux/OEM.ini" "${mfpdir}/share/OEM.ini"

#create symbolic links
# mpf
	cd "${pkgdir}/usr/lib"
	ln -s ./libmfp.so.1.0.1 ./libmfp.so.1
	ln -s ./libmfp.so.1.0.1 ./libmfp.so
	cd -

# 
	cd "${pkgdir}/usr/lib/sane"
	ln -s libsane-smfp.so.1.0.1 libsane-smfp.so.1
	ln -s libsane-smfp.so.1 libsane-smfp.so
	cd -

	echo "smfp" >> "${pkgdir}/etc/sane.d/dll.d/smfp"
	chmod 644 "${pkgdir}/etc/sane.d/dll.d/smfp"
	
# samsungmfp-configurator-qt4
	install -d "${mfpdir}/bin/"
	install -d "${mfpdir}/lib/"
	install -d "${mfpdir}/plugins/configurator/"
	install -d "${mfpdir}/share/"
	install -d "${mfpdir}/share/help/"
	install -d "${mfpdir}/share/help-fr/"
	install -d "${mfpdir}/share/images/"
	install -d "${mfpdir}/share/locale/"
	install -d "${mfpdir}/share/tr/"
	install -d "${mfpdir}/share/ui/"
	install -d "${mfpdir}/share/utils/"
	install -d "${mfpdir}/eula"
	install -d "${pkgdir}/usr/share/applications/"

	install -m 755 -t "${mfpdir}/bin/" ${archsrcdir}/qt4/at_opt/bin/*
	install -m 755 -t "${mfpdir}/plugins/configurator/" ${archsrcdir}/qt4/at_opt/plugins/configurator/*
	install -m 644 -t "${mfpdir}/share/" ${noarchsrcdir}/at_opt/share/VERSION-Common_LINUX
	install -m 644 -t "${mfpdir}/share/" ${noarchsrcdir}/at_opt/share/VERSION-Common_LINUX_Script
	install -m 644 -t "${mfpdir}/share/" ${noarchsrcdir}/at_opt/share/VERSION-Printer_LINUX
	install -m 644 -t "${mfpdir}/share/" ${noarchsrcdir}/at_opt/share/VERSION-Printer_LINUX-Script
	install -m 644 -t "${mfpdir}/share/" ${noarchsrcdir}/at_opt/share/VERSION-Scanner_LINUX
	install -m 644 -t "${mfpdir}/share/" ${noarchsrcdir}/at_opt/share/VERSION-Scanner_LINUX-Script
	install -m 644 -t "${mfpdir}/share/help/" ${noarchsrcdir}/at_opt/share/help/*
	install -m 644 -t "${mfpdir}/share/help-fr/" ${noarchsrcdir}/at_opt/share/help-fr/*
	install -m 644 -t "${mfpdir}/share/images/" ${noarchsrcdir}/at_opt/share/images/*
	cp -r "${noarchsrcdir}/at_opt/share/locale" "${mfpdir}/share/locale/"
	install -m 644 -t "${mfpdir}/share/utils/" ${noarchsrcdir}/at_opt/share/utils/*
	install -m 644 -t "${mfpdir}/share/tr/" ${noarchsrcdir}/qt4/at_opt/share/tr/*
	install -m 644 -t "${mfpdir}/share/ui/" ${noarchsrcdir}/qt4/at_opt/share/ui/*
	install -m 644 -t "${mfpdir}/eula" ${noarchsrcdir}/eula/*
	
	install -m 644 "${startdir}/samsungUDC.desktop" "${pkgdir}/usr/share/applications/samsungUDC.desktop"

	install -m 644 -t "${mfpdir}/lib/" ${archsrcdir}/qt4/at_root/opt/smfp-common/lib/*

	echo "${realmfpdir}/bin/Configurator" >> "${pkgdir}/usr/bin/SamsungConfigurator"
	echo "${realmfpdir}/bin/ImageManager" >> "${pkgdir}/usr/bin/SamsungImageManager"
	echo "${realmfpdir}/bin/printeradd" >> "${pkgdir}/usr/bin/SamsungPrinteradd"
	echo "${realmfpdir}/bin/printertest" >> "${pkgdir}/usr/bin/SamsungPrintertest"
	echo "${realmfpdir}/bin/shhv" >> "${pkgdir}/usr/bin/shhv"
	echo "${realmfpdir}/bin/smfpscan" >> "${pkgdir}/usr/bin/smfpscan"
	chmod -R 755 "${pkgdir}/usr/bin/"

# other stuff
	install -d "${mfpdir}/selinux"
	install -m 644 -t "${mfpdir}" ${noarchsrcdir}/utils/uld_policy.te
}
