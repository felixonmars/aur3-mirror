# Contributor: Nick Bolten <Shirakawasuna at gmail dot com>

pkgname=openbabel-svn
pkgver=3356
pkgrel=1
pkgdesc="A library designed to interconvert between many file formats used in molecular modeling and computational chemistry. (Development tree)"
arch=('i686' 'x86_64')
url="http://openbabel.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'libxml2')
makedepends=('gcc' 'subversion' 'cmake')
options=('!libtool')
conflicts=('openbabel')
provides=('openbabel')
source=()
md5sums=()

_svntrunk=https://openbabel.svn.sourceforge.net/svnroot/openbabel/openbabel/trunk
_svnmod=openbabel

build() {

  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir $_svnmod-build
  cd $_svnmod-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ../$_svnmod
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build

}
