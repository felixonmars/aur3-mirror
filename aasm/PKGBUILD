# Maintainer: Alexandre Becoulet <alexandre.becoulet@free.fr>

pkgname=aasm
pkgver=0.9.1
pkgrel=1
pkgdesc="An advanced modular assembler"
arch=('i686' 'x86_64')
url="http://savannah.nongnu.org/projects/aasm"
license=('GPL3')
depends=()
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  make || return 1
  make check || return 1
  make DESTDIR="$pkgdir/" install
}

md5sums=('611840cd891b321abfbec087efbd0a6b')
