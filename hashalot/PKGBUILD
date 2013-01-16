# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=hashalot
pkgver=0.3
pkgrel=2
pkgdesc="A tool for reading and hashing passphrases"
arch=('i686' 'x86_64')
url="http://www.paranoiacs.org/~sluskyb/hacks/hashalot/"
license=('GPL')
depends=('glibc')
source=(http://www.paranoiacs.org/~sluskyb/hacks/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('5756530afbfb962983416d458bfb1fa3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
