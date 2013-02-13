#  Maintainer: sudokode <sudokode@gmail.com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=sidplay2
pkgver=2.0.9
pkgrel=6
pkgdesc="A command line player for SID music files"
arch=('i686' 'x86_64')
url="http://sidplay2.sourceforge.net"
license=('GPL')
depends=('sidplay2-libs')
makedepends=('pkgconfig' 'autoconf' 'automake')
source=(http://downloads.sourceforge.net/$pkgname/sidplay-$pkgver.tar.gz
        $pkgname.patch)
sha1sums=('2e4589cc59b3d2d37f38b98d7a0a0ba37b82da7a'
          '2f58e0e785236611acda95e48e657ea36b51a230')

build() {
  cd "$srcdir"/sidplay-$pkgver

  patch -Np1 -i "$srcdir"/$pkgname.patch

  ./configure --prefix=/usr --disable-static

  make
}

package () {
  cd "$srcdir"/sidplay-$pkgver

  make DESTDIR="$pkgdir" install
}
