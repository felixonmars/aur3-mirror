# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

pkgname=jansson-git
pkgver=2.6.r57.g88aa6a9
pkgrel=1
pkgdesc="C library for encoding, decoding and manipulating JSON data"
arch=('i686' 'x86_64')
url="https://github.com/akheron/jansson"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'make')
conflicts=('jansson')
provides=('jansson')
source=("$pkgname"::'git://github.com/akheron/jansson.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"

  autoreconf -i
  ./configure --prefix=/usr
  make
  make install DESTDIR=${pkgdir}
}
