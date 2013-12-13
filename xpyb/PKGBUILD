# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Piotr Husiatyński <phusiatynski@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Leios <jrs0037@auburn.edu>

pkgname=xpyb
pkgver=1.3.1
pkgrel=1
pkgdesc="X Python Binding, based on the XCB library"
url=http://xcb.freedesktop.org/
arch=('i686' 'x86_64')
license=('custom:public')
depends=('python2' 'libxcb')
options=(!libtool)
source=(http://xcb.freedesktop.org/dist/${pkgname}-${pkgver}.tar.bz2
        64.patch)
md5sums=('b9b70746cd348836516edcba96d24677'
         '166e5bdf37b7b127dbf53493a330b764')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  patch -p1 -i $srcdir/64.patch 
  cd ..
  PYTHON=python2 ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
