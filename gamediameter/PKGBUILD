# Maintainer: Thomas Schneider <maxmusterm@gmail.com>
# Contributor: Thomas Schneider <maxmusterm@gmail.com>
pkgname=gamediameter
pkgver=0.4.0.3
pkgrel=2
pkgdesc="'Diameter' - is an arcade-style game with elements of economy and adventure. "
arch=('i686' 'x86_64')
url="http://gamediameter.sourceforge.net/"
license=('GPL')
depends=('guichan' 'sdl' 'sdl_image' 'sdl_mixer')
makedepends=()
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/${pkgname/game//}-$pkgver.tar.bz2)
md5sums=('')

build() {
  cd ${srcdir}/$pkgname
  ./configure --prefix=/usr
  make || return 1
  make prefix=${pkgdir}/usr install
}

