# Contributor: Tai Chi Minh Ralph Eastwood <tcmreastwood@gmail.com>
pkgname=libpgf-svn
pkgver=48
pkgrel=1
pkgdesc="A new progressive file format for lossy and lossless image compression."
arch=('i686' 'x86_64')
url="http://www.libpgf.org"
license=('GPL')
makedepends=('svn')
depends=()
conflicts=('libpgf')
provides=('libpgf')
source=()
md5sums=()

_svntrunk="https://libpgf.svn.sourceforge.net/svnroot/libpgf/libpgf"
_svnmod="libpgf"

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
  make install PREFIX=/usr DESTDIR=$pkgdir
}
