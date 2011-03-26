# Contributor: Kamil Neczaj <kneczaj@gmail.com>
pkgname=epson-c65_c66-epkowa-driver
pkgver=2.6.2_2
_pkgver=2.6.2-2
pkgrel=3
pkgdesc="Cups closed-source driver for Epson C65 and C66 printers made by epkowa"
arch=(i686)
url=(http://www.avasys.jp/english/linux_e/index.html/)
license=("GPL", "LGPL", "custom:AVASYS Public Licence")
makedepends=('rpmextract')
depends=('cups' 'gtk' 'ghostscript')
install=epson.install
source=(http://lx2.avasys.jp/pips/sc65_66/pips-sc65_66s-cups-$_pkgver.i386.rpm)
md5sums=9d5f9b5ab6664a0cf0ad71dd68f74b5a

build() {
	cd $startdir/pkg/
	rpmextract.sh $startdir/src/pips-sc65_66s-cups-$_pkgver.i386.rpm
	chmod -R 755 $startdir/pkg/
	install -d $startdir/pkg/etc/rc.d
	install -m 744 $startdir/ekpd $startdir/pkg/etc/rc.d
	install -d $startdir/pkg/usr/share/applications/
	install -m 644 $startdir/ekpstm.desktop $startdir/pkg/usr/share/applications/
	install -d $startdir/pkg/usr/share/licenses/$pkgname/
	install -m 644 "$startdir/AVASYS Public License" "$startdir/pkg/usr/share/licenses/$pkgname/AVASYS Public License"
}
