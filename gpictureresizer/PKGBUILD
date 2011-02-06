# Contributor: Vamp898 <vamp898@web.de>
pkgname=gpictureresizer
pkgver=0.9.3
_pkgname=GPictureResizer
pkgrel=1
pkgdesc="Resizes multiple images easy =)"
arch=('i686' 'x86_64')
url="http://no-url-right.now"
license=('GPL')
depends=('gtkmm')
source=(http://www.ignaz.org/files/$_pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$_pkgname"

  mkdir -p $pkgdir/usr/bin
  ./build.sh
  cp $_pkgname $pkgdir/usr/bin/
}
md5sums=('ec069f3ff97152271a813498addb5f9b')
