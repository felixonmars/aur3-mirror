# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=geeqie-svn
pkgver=1917
pkgrel=1
pkgdesc="Fork of GQview, an lightweight image browser"
arch=('i686' 'x86_64')
url="http://geeqie.sourceforge.net/"
license=('GPL')
depends=('exiv2>=0.16' 'gtk2' 'lcms')
makedepends=('subversion' 'intltool' 'gnome-doc-utils')
provides=('geeqie')
conflicts=('geeqie')
options=(docs)
source=()
md5sums=()

_svntrunk="https://geeqie.svn.sourceforge.net/svnroot/geeqie/trunk"
_svnmod="geeqie"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server......."
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up -r $pkgver
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"

  if [ -e "$srcdir"/$_svnmod-build ]; then
    rm -rf "$srcdir"/$_svnmod-build
  fi
  mkdir -p "$srcdir"/$_svnmod-build

  msg "Starting make..."
  cd "$srcdir"/$_svnmod-build

  ../$_svnmod/autogen.sh --prefix=/usr --enable-debug-log=no
  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
