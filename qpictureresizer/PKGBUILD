# Contributor: Vamp898 <vamp898@web.de>
pkgname=qpictureresizer
_pkgname=QPictureResizer
pkgver=0.9.7
pkgrel=1
pkgdesc="Resizes multiple images at once"
arch=('i686' 'x86_64')
url="http://no-url-right.now"
license=('GPL')
depends=('qt')
source=(http://www.ignaz.org/files/$_pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$_pkgname"

  mkdir -p $pkgdir/usr/bin

  qmake
  make || return 1
  cp QPictureResizer $pkgdir/usr/bin
}
md5sums=('0646681abe48df23ad5fce3521d1af53')
