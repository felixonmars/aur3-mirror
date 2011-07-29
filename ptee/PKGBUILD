# Contributor: Evangelos Foutras <evangelos@foutrelis.com>

pkgname=ptee
pkgver=1.0.1
pkgrel=1
pkgdesc="Duplicate standard input to several subshells, executing in parallel"
arch=('i686' 'x86_64')
url="http://www.stackfoundry.com/other/ptee/"
license=('MIT')
source=(http://dl.stackfoundry.org/ptee/$pkgname-$pkgver.tar.gz)
md5sums=('c82d5d00858ecd07013a2c66b27591f0')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  make PREFIX="$pkgdir/usr" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
