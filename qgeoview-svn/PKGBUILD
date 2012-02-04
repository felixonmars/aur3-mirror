# Contributor: Doug Penner <darwinsurvivor@gmail.com>
pkgname=qgeoview-svn
pkgver=104
pkgrel=1
pkgdesc="A qt based program for viewing and transfering geocaching gpx files."
arch=('i686' 'x86_64')
url="http://code.google.com/p/qgeoview/"
license=('GPL')
optdepends=('gpsbabel: to send data to GPS')
makedepends=('subversion')
provides=('qgeoview')
md5sums=()

_svntrunk=http://qgeoview.googlecode.com/svn/trunk/
_svnmod=qgeoview-svn

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"


  #
  # BUILD
  #
  qmake  || return 1
  make || return 1
  make INSTALL_ROOT="$pkgdir/" install || return 1
}
