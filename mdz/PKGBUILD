# Maintainer: Philipp Überbacher < murks at lavabit dot com >
# Contributor: u8sand < u8sand at gmail dot com >

pkgname=mdz
pkgver=0.1.1
pkgrel=2
pkgdesc="Mandelbrot Deep Zoom, Mandelbrot Set explorer and image renderer"
arch=('i686' 'x86_64')
url="http://jwm-art.net/mdz/"
license=('GPL')
depends=('mpfr' 'gtk2')
source=(http://jwm-art.net/$pkgname/$pkgname-$pkgver.tar.bz2 $pkgname.patch)
md5sums=('173932f9719019d7c7d0305ceb9e5ca0'
         '011f946756ed953f3c8803c01122255b')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  patch Makefile $srcdir/mdz.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make PREFIX=${pkgdir}/usr install
}

# vim:set ts=2 sw=2 et:
