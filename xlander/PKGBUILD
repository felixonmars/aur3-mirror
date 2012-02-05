# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xlander
pkgver=1.0
pkgrel=1
pkgdesc="Three-dimensional view-oriented lunar landing simulation for X11"
arch=('i686' 'x86_64')
url=("http://www.ibiblio.org/pub/Linux/games/arcade/")
license=('custom')
depends=('libxext')
makedepends=('imake')
source=("http://www.ibiblio.org/pub/Linux/games/arcade/${pkgname}.tar.gz"
        "${pkgname}.patch")
md5sums=('28d7663822d950d7195fd4c7944cdcd6'
         '33e0040ddbdf39b8ba4240cd17210171')

build() {
  cd "${srcdir}/${pkgname}"
  patch -p0 -i "../${pkgname}.patch"
  xmkmf || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install install.man || return 1

  sed -n "1,13p" xlander.c > COPYING
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
