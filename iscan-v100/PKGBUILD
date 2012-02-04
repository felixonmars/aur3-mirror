# Contributor: Giovanni Mazzamati <gigi@teppisti.it>
pkgname=iscan-v100
arch=('i686')
pkgver=2.3.0
pkgrel=2
pkgdesc="A front end for Epson V100 scanners compiled from source"
url="http://www.avasys.jp/english/linux_e/dl_scan.html"
license="EPSON"
depends=('sane' 'rpmextract')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install="iscan.INSTALL"
source=("http://lx1.avasys.jp/iscan/$pkgver/iscan-$pkgver-1.c2.tar.gz"
	"http://lx1.avasys.jp/iscan/$pkgver/iscan-plugin-gt-s600-2.0.0-1.c2.i386.rpm")
md5sums=('d0304933c3e43f33d044fb55bae06bf0'
	 'bda9d1dfe5c9524084b01e46a7a9f5e3')



build() {
	  cd $startdir/pkg/
	  rpmextract.sh $startdir/src/iscan-plugin-gt-s600-2.0.0-1.c2.i386.rpm
	  chown -R root.root $startdir/pkg/usr
	  cd $startdir/src/iscan-$pkgver
	  ./configure --prefix=/usr
	  sed "s/static double similarity/double similarity/" -i ./frontend/pisa_tool.h
	  make || return 1
	  make DESTDIR=$startdir/pkg install
	  mkdir -p $startdir/pkg/etc/sane.d
	  mkdir -p $startdir/pkg/etc/hotplug/usb
	  cp $startdir/src/iscan-$pkgver/backend/epkowa.conf $startdir/pkg/etc/sane.d/
	  cp -r $startdir/src/iscan-$pkgver/utils/hotplug/* $startdir/pkg/etc/hotplug/usb/
	  perl -p -i.bak -e 's/scsi EPSON\n/#scsi EPSON\n/g' $startdir/pkg/etc/sane.d/epkowa.conf
	  chown -R root.root $startdir/pkg/etc
	}
