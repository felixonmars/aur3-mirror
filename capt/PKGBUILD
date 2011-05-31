# Maintainer: Robert McCathie <archaur at rmcc dot com dot au>
# Contributor: Juraj Misur <juraj.misur@gmail.com>

pkgname=capt
pkgver=2.30
pkgrel=1
pkgdesc="Canon CAPT Printer Driver for Linux"
arch=('i686' 'x86_64')
url="http://support-au.canon.com.au/contents/AU/EN/0900772408.html"
license=('custom')
install=capt.install
depends=('libxml2' 'popt')
makedepends=('rpmextract')
optdepends=('gtk2: for gui')
source=('http://gdlp01.c-wss.com/gds/4/0900007724/11/Linux_CAPT_PrinterDriver_V230_uk_EN.tar.gz'
		'ccpd'
		'how-to.txt')
md5sums=('a93a9c5ad0b9844a9dc5d4577488672a'
		 'dc4312dd8070d3b1b4231d47f4383020'
		 '2cdb0e8e5d3c21b389cad3b3581a13ec')
build() {
	cd "$pkgdir"
	if [ "$CARCH" = "x86_64" ]; then
		rpmextract.sh ../src/Linux_CAPT_PrinterDriver_V230_uk_EN/64-bit_Driver/RPM/cndrvcups-capt-2.30-1.x86_64.rpm 2> /dev/null
		rpmextract.sh ../src/Linux_CAPT_PrinterDriver_V230_uk_EN/64-bit_Driver/RPM/cndrvcups-common-2.30-1.x86_64.rpm 2> /dev/null
	else
		rpmextract.sh ../src/Linux_CAPT_PrinterDriver_V230_uk_EN/32-bit_Driver/RPM/cndrvcups-capt-2.30-1.i386.rpm 2> /dev/null
		rpmextract.sh ../src/Linux_CAPT_PrinterDriver_V230_uk_EN/32-bit_Driver/RPM/cndrvcups-common-2.30-1.i386.rpm 2> /dev/null
	fi
	mv "$pkgdir/etc/init.d" "$pkgdir/etc/rc.d"
	cp -rp "$pkgdir/usr/local/"* "$pkgdir/usr"
	rm -r "$pkgdir/usr/local"
	install -D -m755 "$srcdir/ccpd" "$pkgdir/etc/rc.d/ccpd"
	mkdir -p "$pkgdir/var/ccpd"
	mkdir -p "$pkgdir/var/captmon"
	install -D -m644 "$srcdir/Linux_CAPT_PrinterDriver_V230_uk_EN/Doc/LICENSE-captdrv-2.30E.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-captdrv-2.30E.txt"
}
