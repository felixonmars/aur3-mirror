# Maintainer: Cayman Nava <caymannava at gmail dot com>
pkgname=libcoin-git
pkgver=v0.4.0.1.r343.g6423b72
pkgrel=1
pkgdesc="A crypto currency library that is based directly on the bitcoin Satoshi client"
arch=('any')
url="https://github.com/libcoin/libcoin"
license=('LGPL')
depends=('boost' 'db' 'icu' 'openssl' 'sqlite')
makedepends=('git')
source=($pkgname::git+https://github.com/libcoin/libcoin)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $srcdir/$pkgname
  ./configure -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
}
