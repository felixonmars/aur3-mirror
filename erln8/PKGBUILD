# vim:set ts=2 sw=2 et:
# Maintainer: Adam Rutkowski <hq@mtod.org>
pkgname=erln8
pkgver=0.9.9
pkgrel=1
pkgdesc="A sneaky Erlang version manager"
arch=('i686' 'x86_64')
url="http://metadave.github.io/erln8/"
source=('git://github.com/metadave/erln8')
license=('Apache License')
makedepends=('git')
provides=('erln8')
md5sums=('SKIP')
conflicts=('erlang')


build() {
  cd $pkgname
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
