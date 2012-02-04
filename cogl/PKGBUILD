# Maintainer: L42y <423300@gmail.com>

pkgname=cogl
pkgver=1.7.6
pkgrel=1
pkgdesc="A hardware accelerated 3D graphics API"
arch=('i686' 'x86_64')
url="http://www.clutter-project.org/"
license=('LGPL')
depends=('gobject-introspection' 'libgl')
options=('!libtool')
source=(http://source.clutter-project.org/sources/${pkgname}/1.7/${pkgname}-${pkgver}.tar.xz)
md5sums=('1e46c63c9b820471cdc12a7af87d8458')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
