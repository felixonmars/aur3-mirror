# Maintainer: Roger Durán <rogerduran at gmail dot com>
pkgname=vzfree
pkgver=0.1
pkgrel=1
pkgdesc="like free but more acurate in openvz"
arch=(i686 x86_64)
url="http://hostingfu.com/article/vzfree-checking-memory-usage-inside-openvz-ve"
license=('Unknown')
depends=(glibc)
makedepends=(gcc make)
source=(http://hostingfu.com/files/vzfree/$pkgname-$pkgver.tgz)
md5sums=('f20798a12ef7d7567867fea0e5e75bf9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # install in /usr/
  mkdir -p $pkgdir/usr/bin/
  sed -i s#/usr/local#$pkgdir/usr/# Makefile
  make install
}

# vim:set ts=2 sw=2 et:
