# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=aasm
pkgver=0.9.2
pkgrel=2
pkgdesc="An advanced modular assembler"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/aasm"
license=('GPL3')
depends=()
makedepends=(perl gperf autoconf automake libtool)
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3307a3caf060be5709da4c73692eaede')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  LDFLAGS="$LDFLAGS -Wl,--no-as-needed" ./configure --prefix=/usr || return 1
  make || return 1
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

