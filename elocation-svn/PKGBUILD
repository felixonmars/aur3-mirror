# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=elocation-svn
pkgver=82812
pkgrel=1
pkgdesc="EFL based library to get location information"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('unknown')
depends=('efl-svn')
makedepends=('subversion')
options=('!libtool')

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/PROTO/elocation"
_svnmod="elocation"

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

  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  make DESTDIR="$pkgdir" install

# delete build directory
  rm -r "$srcdir/$_svnmod-build"
}
