# Contributor: Kent Gustavsson <nedo80@gmail.com>
pkgname=woklib
pkgver=0.9.3
pkgrel=1
pkgdesc="Signaling and plugin handler for wokjab"
url="http://wokjab.nedo.se/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk2')
options=(!libtool)
source=(http://downloads.sourceforge.net/wokjab/${pkgname}-${pkgver}.tar.gz)
md5sums=('38cdfe0f88dbb23d1bcc45933c70e802')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
