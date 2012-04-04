# Maintainer: Carlos Franke <carlos_franke at lemtank dot de>

# Might need a development version of cxxtools to build and use, 
# however as yet there is no AUR package for that.

pkgname=tntdb-svn
pkgver=304
pkgrel=1
pkgdesc="A C++-class-library for easy database-access."
arch=("i686" "x86_64")
url="http://www.tntnet.org/tntdb.html"
license=('GPL')
depends=('cxxtools')
makedepends=('subversion')
provides=('tntdb')
conflicts=('tntdb')

_svntrunk=https://tntdb.svn.sourceforge.net/svnroot/tntdb/trunk/tntdb
_svnmod=tntdb

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
