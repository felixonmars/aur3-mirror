# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=pdiff-svn
pkgver=53
pkgrel=2
pkgdesc="A perceptual difference utility for images."
arch=('i686' 'x86_64')
url="http://pdiff.sourceforge.net/"
license=('GPL')
makedepends=('svn' 'cmake')
depends=('freeimage')
conflicts=('pdiff')
provides=('pdiff')
source=()
md5sums=()

_svntrunk="https://pdiff.svn.sourceforge.net/svnroot/pdiff/trunk"
_svnmod="pdiff-svn"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  rm -rf $_svnmod-build
  svn export $_svnmod $_svnmod-build
  cd "$srcdir/$_svnmod-build"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make install DESTDIR=$pkgdir
}
