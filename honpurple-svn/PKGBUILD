# Maintainer: Joseph Hsu <jhsu.x1 (at the) gmail (dot) com>
pkgname=honpurple-svn
pkgver=166
pkgrel=1
pkgdesc="libpurple plugin for the Heroes of Newerth chat server."
arch=('i686' 'x86_64')
url="http://code.google.com/p/honpurple"
license=('GPL')
depends=("libpurple" "glib2")
makedepends=("svn")
provides=('honpurple')
source=()
md5sums=()

_svntrunk=http://honpurple.googlecode.com/svn/trunk/ 
_svnmod=trunk

build() {
  cd "$srcdir"
  msg "Connecting to SVN server ($_svntrunk)...."
  if [ -d $_svnmod/.svn ] ; then
    cd $_svnmod && svn up
    msg2 "The local files are updated."
  else
    msg2 "Cloning repo..."
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  msg2 "make"
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
