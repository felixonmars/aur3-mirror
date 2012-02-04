# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=scanbuttond
pkgver=0.2.3
pkgrel=1
pkgdesc="allows you to trigger certain actions whenever one of the scanner's front panel buttons has been pressed"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scanbuttond/"
license=('GPL')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('548e6451b398bd95d14f008b4d39ca79')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
    --sysconfdir=/etc
  make || return 1
  make DESTDIR="$pkgdir" install
}
