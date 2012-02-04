# Contributor: Troels Kofoed Jacobsen <tkjacobsen@gmail.com>
# Contributor: Ray Kohler <ataraxia937@gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=shrip
pkgver=0.6.0
pkgrel=1
pkgdesc="Command line tool for ripping DVDs and encoding to AVI/OGM/MKV/MP4"
arch=('i686' 'x86_64')
url="http://ogmrip.sourceforge.net/"
license=('GPL')
depends=('ogmrip' 'glib2')
source=(http://downloads.sourceforge.net/ogmrip/$pkgname-$pkgver.tar.gz
	shrip-main.patch)
md5sums=('fe5da49fb5857b68662be3b1e2406c46' 'faa6a98ccb71faf2f0417481d05c8691')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	patch -p1 < ${srcdir}/shrip-main.patch || return 1

	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$startdir/pkg" install
  
	mkdir -p $startdir/pkg/etc
	cp shrip.conf $startdir/pkg/etc/
}
