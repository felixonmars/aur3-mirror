# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hiredis
pkgver=0.11.0
pkgrel=3
pkgdesc='Minimalistic C client library for Redis'
arch=('x86_64' 'i686')
url="https://github.com/redis/hiredis/"
license=('BSD')
depends=('glibc')
checkdepends=('redis')
changelog='ChangeLog'
source=(https://codeload.github.com/redis/$pkgname/tar.gz/v$pkgver)
md5sums=('e2ac29509823ccc96990b6fe765b5d46')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -r 's|echo \\|echo -e \\|' -i Makefile
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install

  install -Dm 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
