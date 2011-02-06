# Contributor: Benjamin Hedrich <phpogo@gmx.net>
pkgname=pidgin-convreverse
pkgver=0.3
pkgrel=1
pkgdesc="Pidgin-ConvReverse is a pidgin plugin. It reverses any word on all conversation."
arch=('i686' 'x86_64')
url="http://convreverse.sourceforge.net"
license=('GPL')
depends=('pidgin')
makedepends=('gcc')
source=("http://downloads.sourceforge.net/project/convreverse/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e66aa42062a1f0daea63f7a4c5b40a5f940eb25753793cce99f595fc49626826')


build() {
  cd "$srcdir/$pkgname" || return 1

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

