# Maintainer: Radu Andries <admiral0@tuxfamily.org>
pkgname=qstlink2-svn
pkgver=75
pkgrel=1
pkgdesc="A ST-Link V2 (Debugger/Programmer) client."
arch=(i686 x86_64 arm)
url="http://code.google.com/p/qstlink2/"
license=('GPL')
depends=('qt' 'libusb')
makedepends=('subversion')

_svntrunk=http://qstlink2.googlecode.com/svn/trunk/
_svnmod=qstlink2

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
  qmake
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
