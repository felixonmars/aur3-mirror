# Contributor: Giovanni Mazzamati <gigi@teppisti.it>
pkgname=iscan-v100-rpm
arch=('i686')
pkgver=2.3.0
pkgrel=1
pkgdesc="A front end for Epson V100 scanners extract from RPM"
url="http://www.avasys.jp/english/linux_e/dl_scan.html"
license="EPSON"
depends=('sane' 'rpmextract')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install="iscan.INSTALL"
source=("http://lx1.avasys.jp/iscan/$pkgver/iscan-$pkgver-1.c2.i386.rpm"
	"http://lx1.avasys.jp/iscan/$pkgver/iscan-plugin-gt-s600-2.0.0-1.c2.i386.rpm")
md5sums=('f81e42670d315bda86ed95b14ccfbd87'
	 'bda9d1dfe5c9524084b01e46a7a9f5e3')



build() {
	  cd $startdir/pkg/
	  rpmextract.sh $startdir/src/iscan-$pkgver-1.c2.i386.rpm
	  rpmextract.sh $startdir/src/iscan-plugin-gt-s600-2.0.0-1.c2.i386.rpm
	  perl -p -i.bak -e 's/scsi EPSON\n/#scsi EPSON\n/g' $startdir/pkg/etc/sane.d/epkowa.conf
	  chown -R root.root $startdir/pkg/usr
	  chown -R root.root $startdir/pkg/etc
	}
