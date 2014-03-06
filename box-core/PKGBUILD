# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=box-core
_pkgname=box
pkgver=0.4.0
pkgrel=1
pkgdesc="A vector graphics language developed to make graphics as easy as possible"
arch=('i686' 'x86_64')
url="http://boxc.sourceforge.net"
license=('GPL')
depends=('cairo' 'libtool')
optdepends=('box-gui: for a simple GUI in GTK+2')
changelog='ChangeLog'
source=(http://downloads.sourceforge.net/boxc/$_pkgname-$pkgver.tar.gz)
md5sums=('6cecd1bce06a6ae09c5e6db9cf9d11db')

build() {
  unset LDFLAGS
  cd "$srcdir/$_pkgname-$pkgver"
  sed '/static/d' -i box/Makefile.in
  ./configure --prefix=/usr --enable-static=no
  make -j1
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
