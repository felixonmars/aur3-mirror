# Maintainer: Gne Zhang <genneth@gmail.com>
pkgname=the-board
pkgver=0.1.3
pkgrel=1
pkgdesc="GNOME Board"
arch=(x86_64)
url="https://live.gnome.org/TheBoardProject"
license=('GPL')
depends=(mx)
makedepends=()
optdepends=()
source=(http://ftp.gnome.org/pub/GNOME/sources/the-board/0.1/the-board-0.1.3.tar.bz2)
noextract=()
md5sums=('1b521b53c79644849e7cd2f8d75fbd6f')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

