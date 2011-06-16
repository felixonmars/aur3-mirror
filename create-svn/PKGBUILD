pkgname=create-svn
pkgver=1
pkgrel=1
pkgdesc="Create Resources (brushes, palettes etc.)"
arch=('i686' 'x86_64')
url="http://create.freedesktop.org/"
license=('GPL')
makedepends=('subversion' 'cmake')

_svntrunk='https://svn-create.freedesktop.osuosl.org/public/create/create/trunk/'
_svnmod=create

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  if [[ -d ${srcdir}/${_svnmod}-build ]]; then
    msg "Cleaning the previous build directory..."
    rm -rf ${srcdir}/${_svnmod}-build
  fi 

  mkdir $_svnmod-build
  cd $_svnmod-build
  cmake $startdir/src/$_svnmod -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd ${srcdir}/$_svnmod-build
  make DESTDIR=${pkgdir} install
}
		