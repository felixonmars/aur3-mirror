# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=qx11grab
pkgver=0.4.9
pkgdesc="Qt4 applet for recording x11 windows with ffmpeg"
pkgrel=2
arch=(i686 x86_64)
url="http://qx11grab.hjcms.de/"
license=(GPL)
makedepends=('cmake')
depends=('qt4' 'ffmpeg>=1.0' )
options=()
install="$pkgname.install"
source=(http://qx11grab.hjcms.de/downloads/${pkgver}/${pkgname}-${pkgver}.tar.xz $pkgname.install)
md5sums=('3884a3fe27667e36a11c235fb3bc1d77' '45ab05125b7409da2768c18182818bb0')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package(){
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
