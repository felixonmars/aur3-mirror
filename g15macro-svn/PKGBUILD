pkgname=g15macro-svn
pkgver=539
pkgrel=1
pkgdesc="A simple Macro recording/playback app for G15Daemon."
arch=('i686' 'x86_64')
url="http://www.g15tools.com/"
license=('GPL')
depends=('g15daemon-svn' 'libxtst')
makedepends=('subversion')
options=(!libtool)
conflicts=('libg15')
source=()
md5sums=()

_svnmod=g15macro
_svntrunk=https://g15tools.svn.sourceforge.net/svnroot/g15daemon/trunk/g15daemon-clients/$_svnmod

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
  
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make || return 1
}

package() {
  make DESTDIR="${pkgdir}" install
}
