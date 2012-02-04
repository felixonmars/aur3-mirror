# Contributor: Leonid Selivanov <bravebug at gmail dot com>

pkgname=ccss
pkgver=0.5.0
pkgrel=3
pkgdesc="CSS reading library"
arch=('i686' 'x86_64')
url="http://cgit.freedesktop.org/ccss/"
license=('GPL')
depends=('cairo>=1.4' 'libtool' 'libsoup' 'librsvg')
makedepends=('gtk-doc')
provides=($pkgname=$pkgver)
conflicts=($pkgname)
groups=()
source=(http://cgit.freedesktop.org/ccss/snapshot/${pkgname}-${pkgver}.tar.bz2)
md5sums=('f81e9834eae3208072b6343fbc849587')

build() {
  cd $srcdir/${pkgname}-${pkgver}/
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-examples || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
