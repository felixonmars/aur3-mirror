# User space interface to the galcore kernel driver.
# Maintainer: Brandon Edens <brandonedens@gmail.com>

pkgname=libetnaviv
pkgbase=$pkgname-git
pkgver=0.1
pkgrel=1
pkgdesc='User space interface to the galcore kernel driver.'
arch=('armv7h')
url="https://github.com/etnaviv/libetnaviv/"
srcname=libetnaviv
makedepends=('git sed')
provides=("$pkgname")
conflicts=("$pkgname")
source=('git+https://github.com/etnaviv/libetnaviv.git')
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  make install DESTDIR=$pkgdir
}

# vim:set ts=2 sw=2 et:
