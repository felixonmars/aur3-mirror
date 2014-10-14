# Maintainer: Alexander Kout <alex@kout.de>

pkgname=tvtime-ubuntu
_orig_pkgname=tvtime
_orig_pkgver=1.0.2
_diff_pkgver=12.1ubuntu3
pkgver=$_orig_pkgver\_$_diff_pkgver
pkgrel=1
pkgdesc="A high quality television application for use with video capture cards, with patches from Ubuntu."
arch=('i686' 'x86_64')
url='http://tvtime.sourceforge.net/'
license=('GPL' 'LGPL')
provides=('tvtime')
conflicts=('tvtime')
depends=('libpng' 'libxml2' 'freetype2' 'libxinerama' 'libxv'
	 'libsm' 'libxxf86vm' 'alsa-lib' 'libxss' 'hicolor-icon-theme')
makedepends=('libxt' 'v4l-utils')
source=(
#http://archive.ubuntu.com/ubuntu/pool/universe/t/tvtime/$_orig_pkgname\_$_orig_pkgver.orig.tar.gz
	http://downloads.sourceforge.net/sourceforge/tvtime/$_orig_pkgname-$_orig_pkgver.tar.gz
	http://archive.ubuntu.com/ubuntu/pool/universe/t/tvtime/$_orig_pkgname\_$_orig_pkgver-$_diff_pkgver.diff.gz)

build() {
	cd $srcdir/$_orig_pkgname-$_orig_pkgver
	zcat ../$_orig_pkgname\_$_orig_pkgver-$_diff_pkgver.diff.gz | patch -p1
	for i in `cat debian/patches/series`; do patch -p1 < debian/patches/$i; done

	echo "StartupWMClass=tvtime" >>docs/net-tvtime.desktop

	autoreconf -i -f

	[ -f Makefile ] || ./configure --prefix=/usr \
                                   --mandir=/usr/share/man \
                                   --infodir=/usr/share/info \
                                   --localstatedir=/var \
                                   --sysconfdir=/etc \
                                   --with-fifogroup=video \
                                   --without-directfb \
                                   --without-sdl
  make
}

package() {
	cd $srcdir/$_orig_pkgname-$_orig_pkgver
	make DESTDIR=$pkgdir install

	rm -f $pkgdir/usr/share/tvtime/FreeMonoBold.ttf
	rm -f $pkgdir/etc/tvtime/tvtime.xml

	install -D -m644 docs/html/default.tvtime.xml $pkgdir/usr/share/tvtime/default.tvtime.xml
}

md5sums=('4b3d03afe61be239b08b5e522cd8afed'
         'c8eaa992d551d69fae3c5401bd027e93')
