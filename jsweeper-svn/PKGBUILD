# Contributor:  Bjoern Lindig < bjoern dot lindig at googlemail dot com >
pkgname=jsweeper-svn
pkgver=45
pkgrel=1
pkgdesc="A port connection manager with support for port aliases and port groups."
url="http://svn.fuzzle.org/jsweeper/trunk/README.TXT"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('jack' 'gtkmm' 'dbus-glib')
makedepends=('cmake')
source=(${pkgname}.patch)

_svntrunk=http://svn.fuzzle.org/jsweeper/trunk
_svnmod=JSweeper

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build/src"
  patch < ${srcdir}/${pkgname}.patch || return 1
  cd "$srcdir/$_svnmod-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr DESTDIR=${pkgdir}  . || return 1
  make DESTDIR=${pkgdir} install || return 1

}
md5sums=('8fd1e3cf97018bb02aeb5a126c3c3e2c')
md5sums=('f7a819fab87494240d28ca9777ead5ae')
md5sums=('fc38c07f3f4005961d807d51e4c87787')
