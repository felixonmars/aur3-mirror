# Maintainer: Florian Zeitz <florob@babelmonkeys.de>
pkgname=headerdoc
pkgver=8.9.14
pkgrel=2
pkgdesc="A text processing engine designed to pull specially-formatted comments out of source code and header files."
arch=('i686' 'x86_64')
url="http://www.opensource.apple.com"
license=('custom:Apple Public Source License')
depends=('libxml2' 'perl-html-parser' 'perl-uri' 'perl-freezethaw')
source=(http://www.opensource.apple.com/tarballs/headerdoc/$pkgname-$pkgver.tar.gz)
md5sums=('26cdc27e7e3c3dfcf6e0989281850367')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make all_internal
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  LC_ALL=C make -k test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DSTROOT="$pkgdir/" installsub
  install -Dm644  "APPLE_LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
