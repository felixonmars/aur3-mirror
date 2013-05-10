pkgname=libg15-svn
pkgver=324
pkgrel=1
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('libusb')
makedepends=('subversion')
options=(!libtool)
conflicts=('libg15')
source=()
md5sums=()

_svnmod=libg15
_svntrunk=https://g15tools.svn.sourceforge.net/svnroot/g15tools/trunk/$_svnmod

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
  
  ./bootstrap
  ./configure --prefix=/usr --disable-static
  make || return 1
}

package() {
  make DESTDIR="${pkgdir}" install
}
