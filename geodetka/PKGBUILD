# Maintainer: Bogusław Ciastek  sq5tb[at]tlen.pl
pkgname=geodetka
pkgver=1.2.3
pkgrel=1
pkgdesc="Program for basic geodetic and land surveying computations written in GTK."
arch=('i686', 'x86_64')
url="http://ciastek.eu/geodetka/"
license=('GPL2')
groups=('science')
depends=('gtk2>=2.4.0', 'sqlite3')
#backup=()
#options=()
install=geodetka.install
changelog=ChangeLog.aur
source=(${pkgname}-${pkgver}.tar.gz::http://ciastek.eu/sites/ciastek.eu/files/content/geodetka/${pkgname}_${pkgver}-1.tar.gz)
md5sums=('4243cc64c1352ec524c46b6834e443ef')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}


package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
