# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=aasm
pkgver=0.9.2
pkgrel=1
pkgdesc="An advanced modular assembler"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/aasm"
license=('GPL3')
depends=()
makedepends=(perl gperf autoconf automake libtool)
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make check || return 1
  make DESTDIR="$pkgdir/" install
}

md5sums=('3307a3caf060be5709da4c73692eaede')
