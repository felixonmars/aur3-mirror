# Contributor: zoulnix <http://goo.gl/HQaP>
pkgname=delta3d-svn
pkgver=7446
pkgrel=1
pkgdesc="Game engine appropriate for a wide variety of modeling & simulation."
arch=('i686' 'x86_64')
url="http://delta3d.org/"
license=('LGPL')
depends=('cal3d' 'cegui-0.7' 'fltk' 'freealut' 'gdal' 'gnelib-svn' 'ode' \
	 'opendis-cpp' 'openscenegraph' 'plib' 'xerces-c')
makedepends=('cmake' 'gcc' 'make' 'pkg-config' 'subversion')
options=('!libtool')
provides=('delta3d')
conflicts=('delta3d')
source=()
md5sums=('')

_svnmod="delta3d"
_svntrunk="https://delta3d.svn.sourceforge.net/svnroot/delta3d/trunk/delta3d"

build() { 
  cd ${srcdir}

  #####
  msg "Getting sources..."
  if [ -d ${_svnmod}/.svn ]; then
    cd ${_svnmod} && svn up -r ${pkgver}
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
    cd ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  #####

  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
	  -DGNE_LIBRARY=/usr/lib \
	  -DLIB_POSTFIX= \
	  -DBUILD_EXAMPLES=0 \
	  -DBUILD_DEMOS=0 \
	  -DBUILD_WITH_QT=0 || return 1

  make || return 1
}

package() {
  cd ${srcdir}/${_svnmod}

  make DESTDIR=${pkgdir} install || return 1
}
