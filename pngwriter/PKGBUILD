# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: damir <damir@archlinux.org>

pkgname=pngwriter
pkgver=0.5.4
pkgrel=1
pkgdesc="A C++ library for creating PNG images"
arch=('i686' 'x86_64')
url="http://$pkgname.sourceforge.net/"
license=('GPL')
depends=('libpng')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz \
	makefile.diff)
md5sums=('842c3b1b2af9a7acc3ac0abc8015ba50'
         'fb9ddde404f480024a9355afe7dad043')

build() {
  cd $pkgname-$pkgver

  patch -Np0 -i ../makefile.diff || return 1

  make PREFIX=/usr libpngwriter || return 1
  make PREFIX=/usr DESTDIR=$pkgdir install
}
