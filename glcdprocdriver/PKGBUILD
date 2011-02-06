# Maintainer:  ulceris_at_yandex.ru

pkgname=glcdprocdriver
pkgver=0.0.5
pkgrel=1
_kernver=2.6.30-ARCH
pkgdesc="GLCDprocDriver graphics library"
arch=('i686' 'x86_64')
url="http://developer.berlios.de/"
license=('GPL')
depends=()
makedepends=()
source=(http://www.muresan.de/graphlcd/lcdproc/$pkgname-$pkgver.tar.bz2)
md5sums=('f33023e6966f4ca64781504a17e5d286')

build() {

cd "$srcdir/$pkgname-$pkgver"
        patch -p1 -i ../glcdprocdriver-gcc44.patch || return 1  		
	make || return 1
	make DESTDIR=$startdir/pkg/usr install || return 1
}

