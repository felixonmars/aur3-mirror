# Contributor: Perttu Ahola <gmail/celeron55>
# Contributor: Alex Hall <alumni.purdue.edu/hall12> 
# Maintainer: Mathieu Gaborit <mat.gaborit@gmx.com>

pkgname=libarea-svn
pkgver=55
pkgrel=1
pkgdesc="CNC Toolpath Generating Library for Pocketing"
arch=('i686' 'x86_64')
url="https://code.google.com/p/libarea/"
license=('GPL3')
makedepends=('boost' 'cmake' 'subversion')
depends=('python2')
provides=('libarea', 'python-libarea')
conflicts=('libarea')

source=('CMakeLists.txt.patch')
md5sums=('b239774e1d9b8e336aff1d43339027e2')

_svntrunk=http://libarea.googlecode.com/svn/trunk
_svnmod=trunk

build() {
  cd "$srcdir"

  svn checkout $_svntrunk $_svnmod
  patch -p0 < CMakeLists.txt.patch

  mkdir build && cd build/

  cmake -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr ../$_svnmod
  make
}

package () {
  make -C $srcdir/build install
}
