#Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=libtuxcap
pkgver=1.4.0
pkgrel=3
pkgdesc="Port of the PopCap games framework, used for 2D game development."
arch=(i686 x86_64)
url="http://sourceforge.net/projects/tuxcap/"
license=('custom')
depends=('imagemagick' 'sdl_mixer' 'python2' 'glu')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/tuxcap/tuxcap/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/tuxcap-build"

## Fix few headers ##
  sed 's|<string>|<string>\n#include <stdint.h>|' -i ../tuxcap/include/MTRand.h
  sed 's|<string>|<string>\n#include <stdint.h>|' -i ../tuxcap/include/ImageLib.h
## EOF ##

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DPYTHON_LIBRARY=/usr/lib/libpython2.7.so.1.0 \
	-DPYTHON_INCLUDE_DIR=/usr/include/python2.7 ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/tuxcap-build"

  make DESTDIR="${pkgdir}/" install

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp ../COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('d1cf3d9105a8619676dd59330bf2bd0e')
