# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>
# Contributor: Leslie P. Polzer <polzer@gnu.org>

pkgname=statifier
pkgver=1.7.3
pkgrel=1
pkgdesc="A tool for generating static binaries of dynamic ELF executables"
arch=('i686' 'x86_64')
url="http://statifier.sourceforge.net/"
license=('GPL')
[[ $CARCH = x86_64 ]] && options=('!makeflags')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('a62d16e0f27abcb18265eb2cf4cf3f92f4f8c5954be40bd5e66d5236f03c8649')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '12 s/yes/no/' configs/config.x86_64
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
