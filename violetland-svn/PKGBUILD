pkgname=violetland-svn
pkgver=406
pkgrel=1
pkgdesc="Violetland is an open source cross platform crimsonland game clone"
arch=('i686' 'x86_64')
url="http://code.google.com/p/violetland/"
license=('GPL3')
makedepends=('cmake' 'subversion')
depends=('sdl_image' 'sdl_mixer' 'sdl_ttf')
conflicts=('violetland')
provides=('violetland')
source=('boostfs.patch')
md5sums=('193bb3ad7370af0ed0e03bfedf529973')

_svntrunk="http://violetland.googlecode.com/svn/trunk/"
_svnmod="violetland"

build() {
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  [[ -d "$_svnmod-build" ]] && rm -rf "$_svnmod-build"
  cp -r "$_svnmod" "$_svnmod-build"
  cd "$_svnmod-build"

  patch -Np1 <../boostfs.patch

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make install DESTDIR="$pkgdir"
}
