# Maintainer: Marq Schneider <queueRAM@gmail.com>
pkgname=stereograph
pkgver=0.33b
pkgrel=1
epoch=
pkgdesc="stereogram generator"
arch=('i686' 'x86_64')
url="http://stereograph.sourceforge.net/index.html"
license=('GPL')
depends=('libpng' 'libjpeg' 'libx11')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz
        gcc_make_libpng.patch)
md5sums=('528d45b221dbb6c92204f47bb8386a2c'
         '23dd7d4def934dcb6152c5c4dbb3d576')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/gcc_make_libpng.patch"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man1"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
