# Maintainer: George Kibardin <george.kibardin@gmail.com>
pkgname=quickpurple
pkgver=0.1
pkgrel=1
pkgdesc="Quickpurple is Pidgin plugin which provides quick buddy lookup, status switch, unread messages list and access to some Pidgin dialogs."
arch=('i686' 'x86_64')
url="http://code.google.com/p/quickpurple"
license=('BSD')
depends=('pidgin')
source=(http://quickpurple.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('01f7a8c25ef98f786a10f382a197d16e')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  make DESTDIR="$pkgdir" install
}

