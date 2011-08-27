# Maintainer: George Kibardin <george.kibardin@gmail.com>
pkgname=quickpurple
pkgver=0.3
pkgrel=1
pkgdesc="Quickpurple is Pidgin plugin which provides quick buddy lookup, status switch, unread messages list and access to some Pidgin dialogs."
arch=('i686' 'x86_64')
url="http://code.google.com/p/quickpurple"
license=('BSD')
depends=('pidgin' 'gtkhotkey')
source=(http://quickpurple.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('ea08900f4f6dff10a5fc89a84b480e70')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}

