# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=pgf-svn
pkgver=45
pkgrel=1
pkgdesc="Command line tool used to compress PGF files."
arch=('i686' 'x86_64')
url="http://www.libpgf.org"
license=('GPL')
makedepends=('svn')
depends=('libpgf-svn' 'freeimage')
conflicts=('pgf')
provides=('pgf')
source=()
md5sums=()

_svntrunk="https://libpgf.svn.sourceforge.net/svnroot/libpgf/pgf"
_svnmod="pgf"

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
  sh ./autogen.sh
  ./configure --prefix=/usr
  #sed -i 's/\(-lfreeimageplus\)/-lfreeimage \1/' src/Makefile.am
  # HACKS
  sed -i 's/CImage.$(OBJEXT)/CImage.cpp/' src/Makefile
  make install PREFIX=/usr DESTDIR=$pkgdir
}
