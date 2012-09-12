# Contributor: wizzomafizzo
# Maintainer: Ben Reedy <thebenj88 *AT* gmail *DOT* com>

pkgname=mtxe
pkgver=1.0.2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Yet another program that prints the code from the movie, Matrix"
url="http://personal.penny-craal.org/midianian/hack/#mtxe"
license="GPL"
depends=('frag-opt')
source=(http://personal.penny-craal.org/midianian/hack/files/${pkgname}-${pkgver}.tar.bz2)
md5sums=('395cc99fa9ddb51d5ec1a6c201288dc4')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install
}
