# Contributor: Ben Reedy <thebenj88 *AT* gmail *DOT* com>
# Maintainer: Ben Reedy <thebenj88 *AT* gmail *DOT* com>

pkgname=frag-opt
pkgver=0.5.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A re-entrant argument parsing library that can parse regular short, long, negation, short and long options."
url="http://personal.penny-craal.org/midianian/hack/"
license="LGPL"
source=(http://personal.penny-craal.org/midianian/hack/files/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d8aa906aa3104e5abaabb866051e68dc')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install
}
