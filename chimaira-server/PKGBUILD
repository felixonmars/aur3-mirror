# Maintainer: Dominique Lasserre <lasserre.d@gmail.com>
pkgname=chimaira-server
pkgver=0.2
pkgrel=2
pkgdesc='Chimaira allows managing files based on attributes instead of a classical directory tree. The server can handle multiple clients over D-Bus events and will watch directories for changes.'
arch=('i686' 'x86_64')
url="http://code.google.com/p/chimaira/"
license=('GPL3')
depends=('libgee' 'sqlite')
makedepends=('vala')
conflicts=('chimaira-server-git')
source=("http://chimaira.googlecode.com/files/chimaira-server_${pkgver}.tar.gz")
md5sums=('004b80401c89a52e8cf6b04625f2d548')

build() {
  cd "$srcdir/$pkgname"
  libtoolize --force --install
  ./autogen.sh
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
