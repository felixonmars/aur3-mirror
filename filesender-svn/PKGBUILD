# Contributor:  PERES Martin <mupuf@free.fr>
arch=(i686 x86_64)
pkgname=filesender-svn
pkgver=69
pkgrel=2
pkgdesc="FileSender is a simple way to share binary files with your relatives. This will checkout and package the latest SVN version."
url="http://filesender.mupuf.org"
license=('GPL')

depends=('qt' 'ppasskeeper>=1.0b2' 'libnotify')
makedepends=('subversion' 'libnotify')
conflicts=('filesender')
provides=('filesender')

source=()
md5sums=()

_svntrunk=svn://filesender.mupuf.org/trunk
_svnmod=filesender

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .. || return 1
  make || return 1
  make install || return 1

  rm -rf $startdir/src/$_svnmod-build
}

