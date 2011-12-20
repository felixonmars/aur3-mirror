# Maintainer: Christofer Bertonha <chritoferbertonha@gmail.com>

pkgname=cableswig-cvs
pkgver=20111220
pkgrel=1
pkgdesc="CableSwig is used to create interfaces (i.e. "wrappers") to interpreted languages such as Tcl and Python"
arch=(i686 x86_64)
url="http://http://www.itk.org/ITK/resources/CableSwig.html"
license=('custom')
makedepends=('cvs' 'cmake')
provides=('cableswig')
conflicts=('cableswig')

_cvsroot=":pserver:anonymous@public.kitware.com:/cvsroot/CableSwig"
_cvsmod="CableSwig"

build() {
  cd ${srcdir}

  msg "Connecting to ${_cvsmod} CVS server..."
  if [ -d ${_cvsmod}/CVS ]; then
    cd ${_cvsmod}
    cvs -z3 update -dP -D ${pkgver}
  else
    cvs -z3 -d $_cvsroot co -D ${pkgver} -f ${_cvsmod}
    cd ${_cvsmod}
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  mkdir -p build && cd build
  cmake \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    ..

  make

}

package() {
  cd ${srcdir}/${_cvsmod}/build
  make DESTDIR=${pkgdir} install
}
