# Contributor: Ross Clarke <encrypted@geekz.za.net>
pkgname=gmudix
pkgver=1.0
pkgrel=1
pkgdesc="GTK+2 improved version of MUDix"
url="http://dw.nl.eu.org/mudix.html"
license="GPL"
depends=('gtk2' 'glib2' 'pango' 'cairo')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://dw.nl.eu.org/gmudix/$pkgname-$pkgver.tar.gz)
md5sums=('bcdd48048fb3b483516872d1d0d593d9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
