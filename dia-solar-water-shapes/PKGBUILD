# Maintainer: Fr_nk (Frank) <dia-solar-water-shapes AT vi-di.fr>
pkgname=dia-solar-water-shapes
pkgver=1.0
pkgrel=1
pkgdesc="Solar water shapes package for DIA"
arch=('x86_64' 'i686')
url="http://git.vi-di.fr/dia-solar-water-shapes/"
license=('unknown')
depends=('dia')
makedepends=('make')
provides=('dia-solar-water-shapes')
conflicts=()
source=(http://git.vi-di.fr/${pkgname}/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('012f84e5ce3daf8602c50f8b0328cc1c')

package() {
  cd ${pkgname}
  make DESTDIR=${pkgdir} install
}
