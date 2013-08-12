# Maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: slaveriq <arch@plassmann.biz>

pkgname=xhp-git
pkgver=0d770a0
pkgrel=1
pkgdesc="A PHP extension which augments the syntax of the language such that XML document fragments become valid PHP expressions."
arch=('i686' 'x86_64')
url="http://github.com/facebook/xhp"
license=('GPL')
depends=('php')
makedepends=('git' 're2c')
source=('git://github.com/facebook/xhp.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/xhp"

  phpize

  ./configure --prefix=/usr
  find -name 'Makefile' -exec sed -i "/EXTENSION_DIR/s|/usr|$pkgdir/usr|" {} \;

  make
}

check() {
  cd "$srcdir/xhp"
  make test <<< n
}

pkgver() {
  cd "$srcdir/xhp"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/xhp"
  make install
} 
