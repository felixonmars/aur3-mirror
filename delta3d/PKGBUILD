# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=delta3d
pkgver=2.5.0
pkgrel=2
pkgdesc="Game engine appropriate for a wide variety of modeling & simulation."
arch=('i686' 'x86_64')
url="http://delta3d.org/"
license=('LGPL')
depends=('cal3d' 'cegui' 'fltk' 'freealut' 'gdal' 'gnelib-svn' 'ode' \
	 'opendis-cpp' 'openscenegraph' 'plib' 'xerces-c')
makedepends=('cmake' 'gcc' 'make' 'pkg-config')
options=('!libtool')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgver}/dt_${pkgver}_source.zip)
md5sums=('67e709303ea0fda62678e48f21ad4907')

build() { 
  cd ${srcdir}/${pkgname}_REL-${pkgver}

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
	  -DGNE_LIBRARY=/usr/lib \
	  -DLIB_POSTFIX= \
	  -DBUILD_EXAMPLES=0 \
	  -DBUILD_DEMOS=0 \
	  -DBUILD_WITH_QT=0 || return 1

  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}_REL-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
