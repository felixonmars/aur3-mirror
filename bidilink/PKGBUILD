# Contributor: Oguz Han Asnaz <O.Asnaz@gmx.net>

pkgname=bidilink
pkgver=0.1
pkgrel=1
pkgdesc="A general purpose Unix tool for linking two bidirectional data streams together."
arch=('i686' 'x86_64')
url="http://0pointer.de/lennart/projects/bidilink/"
license=('GPL')
depends=('lynx')
makedepends=('make')
source=('http://0pointer.de/lennart/projects/bidilink/bidilink-0.1.tar.gz')
md5sums=('f7e077061323415f73eed53da0694c4a')

build() {
  cd $startdir/src/bidilink-$pkgver/
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
