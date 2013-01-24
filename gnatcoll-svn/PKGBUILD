# Maintainer: Your Name <youremail@domain.com>
pkgname=gnatcoll-svn
pkgver=201445
pkgrel=2
pkgdesc=""
arch=()
pkgrel=1
pkgdesc="GNAT GPL release of the GNAT reusable components for Ada"
arch=('i686' 'x86_64')
url="http://libre.adacore.com/tools/gnat-component-collection/"
license=('GPL')
depends=('gcc-ada')
makedepends=('gprbuild' 'subversion')

_svntrunk=http://svn.eu.adacore.com/anonsvn/Dev/trunk/gps/gnatlib
_svnmod=tag

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
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
