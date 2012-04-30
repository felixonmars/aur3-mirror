# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=libemaneeventservice
pkgver=0.4.9
pkgrel=1
pkgdesc="Library used for sending events to EMANE"
arch=('i686' 'x86_64')
url="http://labs.cengen.com/emane/download/addons/libemaneeventservice.html"
license=('BSD')
depends=('emane')
source=(http://labs.cengen.com/emane/download/source/0.7.3/$pkgname-$pkgver.tar.gz)
md5sums=('b5d4b04e67f9d365a2488408efb3260c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
