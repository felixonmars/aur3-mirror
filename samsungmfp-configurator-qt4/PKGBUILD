pkgname=samsungmfp-configurator-qt4
pkgver=3.00.90
pkgrel=1

pkgdesc="Samsung Unified Driver Configurator (Qt4 interface)"
arch=(x86_64)
url="http://www.samsung.com"
license=('custom:samsung')
depends=('samsung-unified-driver')

source=("http://www.bchemnet.com/suldr/UnifiedLinuxDriver-${pkgver}.tar.gz"
	'samsungUDC.desktop' 'samsungUDC-root.desktop')

md5sums=('a0c3c978ae0d2ce9d125f7b2ad9fe6fb' '60d734597e34afedd2eda82318738120' '544eca581b7ad65713cbb8725afac02c')

if [ "$CARCH" = "x86_64" ]; then
	CARCHCUSTOM="x86_64"
	LIBDIRCUSTOM="lib64"
else
	CARCHCUSTOM="i386"
	LIBDIRCUSTOM="lib"
fi

build() {
# samsungmfp-configurator-qt4
	install -d "${pkgdir}/opt/Samsung/mfp/bin/"
	install -d "${pkgdir}/opt/Samsung/mfp/lib/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/help/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/images/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/tr/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/ui/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/utils/"
	install -d "${pkgdir}/usr/share/applications/"

	install -m 755 -t "${pkgdir}/opt/Samsung/mfp/bin/" ${srcdir}/cdroot/Linux/${CARCHCUSTOM}/qt4/at_opt/bin/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/lib/" ${srcdir}/cdroot/Linux/${CARCHCUSTOM}/qt4/at_opt/lib/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/eula.htm
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Common_LINUX
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Common_LINUX_Script
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Printer_LINUX
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Printer_LINUX-Script
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Scanner_LINUX
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Scanner_LINUX-Script
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/help/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/help/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/images/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/images/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/utils/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/utils/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/tr/" ${srcdir}/cdroot/Linux/noarch/qt4/at_opt/share/tr/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/ui/" ${srcdir}/cdroot/Linux/noarch/qt4/at_opt/share/ui/*
	
	install -m 644 "${startdir}/samsungUDC.desktop" "${pkgdir}/usr/share/applications/samsungUDC.desktop"
	install -m 644 "${startdir}/samsungUDC-root.desktop" "${pkgdir}/usr/share/applications/samsungUDC-root.desktop"

	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/lib/" ${srcdir}/cdroot/Linux/${CARCHCUSTOM}/qt4/at_root/opt/smfp-common/${LIBDIRCUSTOM}/*
}

