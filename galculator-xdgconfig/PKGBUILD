# Contributor: Richard Gill <richard houbathecat fr>

pkgname=galculator-xdgconfig
pkgver=1.3.4
pkgrel=2
pkgdesc="GTK+ based scientific calculator"
arch=('i686' 'x86_64')
url="http://galculator.sourceforge.net/"
license=('GPL')
conflicts='galculator'
depends=('libglade')
makedepends=('intltool')
source=(http://downloads.sourceforge.net/galculator/galculator-$pkgver.tar.bz2 galculator-$pkgver-xdgconfig.patch)
md5sums=('d30e6fbf5947bb1c873bc9d5a21046f1' '402307d2faefd29265d078ecb4808dec')

build() {
  cd "$srcdir/galculator-$pkgver"
  patch -Np1 -i "$srcdir/galculator-$pkgver-xdgconfig.patch"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
