# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=quad-ren
pkgver=0.5
pkgrel=2
pkgdesc="Resolution independent 2D graphics engine."
arch=('i686' 'x86_64')
url="http://quad-ren.sourceforge.net/"
license=('LGPL')
depends=('libpng' 'mesa' 'sdl')
makedepends=('cmake' 'gcc' 'make' 'pkg-config')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('8b40051d236cc9dcc0c5c07c25e7fca9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make || return 1

}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
