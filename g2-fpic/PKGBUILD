# Maintainer: Albert Graef <aggraef at gmail dot com>

pkgname=g2-fpic
_pkgname=g2
pkgver=0.72
pkgrel=2
pkgdesc="2D graphics library compiled with -fPIC"
arch=("i686" "x86_64")
license=('GPL')
url="http://g2.sourceforge.net"
depends=('gd' 'gcc' 'libpng' 'libjpeg')
provides=('g2')
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz"
	"$_pkgname-$pkgver-sharedlib.patch" )
md5sums=('4b2dc9252c1c785dcb0e0a84d7ba7119'
         '7a5b39a22922d5d947aa7a4928bb5730')

build() {

	cd $srcdir/$_pkgname-$pkgver
	patch -p1 < ../$_pkgname-$pkgver-sharedlib.patch
	./configure --prefix=/usr
	make
}

package() {
	cd $srcdir/$_pkgname-$pkgver
	make LIBDIR=$pkgdir/usr/lib INCDIR=$pkgdir/usr/include install
	ln -sf libg2.so.0.$pkgver $pkgdir/usr/lib/libg2.so
}
