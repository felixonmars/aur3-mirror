# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=clutter-gesture
pkgver=0.0.2.1
pkgrel=1
pkgdesc="Clutter Gesture library"
arch=('i686' 'x86_64')
url="http://moblin.org/projects/clutter-gesture"
license=('LGPL')
depends=('clutter')
options=('!libtool')
source=("http://git.moblin.org/cgit.cgi/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.bz2")
md5sums=('8bb3a409a9b017d8510363e171e94116')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
}
