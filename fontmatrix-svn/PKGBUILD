# Contributor: Chebotarev Sergey <sachebotarev@gmail.com>
# Contributor: Aurélien DESBRIÈRES <ice.cube@gmx.com>
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>

pkgname=fontmatrix-svn
pkgver=1220
pkgrel=4
pkgdesc="Font manager for Linux"
arch=('i686' 'x86_64')
url="http://fontmatrix.net/"
license=('GPL')
depends=('qtwebkit' 'hicolor-icon-theme')
conflicts=('fontmatrix')
makedepends=('subversion' 'cmake>=2.4.0' 'mesa')
install=fontmatrix.install
source=(fontmatrix::'svn+http://svn.gna.org/svn/undertype/trunk/tools/typotek')
md5sums=('SKIP')
_svnmod=fontmatrix

pkgver() {
  cd "$srcdir"/$_svnmod
  svnversion | tr -d [A-z]
}

build() {
  cd ${srcdir}/${_svnmod}
  export QTDIR=/usr
  if [ "${CARCH}" = "i686" ]; then
    export QMAKESPEC=/usr/share/qt/mkspecs/linux-g++-32
  elif [ "${CARCH}" = "x86_64" ]; then
    export QMAKESPEC=/usr/share/qt/mkspecs/linux-g++-64
  fi	
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {  	
  cd ${srcdir}/${_svnmod}/build
  make DESTDIR=$pkgdir install
}
