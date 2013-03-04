# Maintainer: mar77i <mysatyre at gmail dot com>
pkgname=diskimagery64-svn
pkgver=36
pkgrel=2
pkgdesc="DiskImagery64 is a portable (Qt-based), open-source disk image editor for Commodore 64 disk images."
arch=('i686' 'x86_64')
url="http://lallafa.de/blog/diskimagery64/"
license=('GPL')
depends=(qt4)
makedepends=('subversion')
source=(trunk_cleanup.patch)
md5sums=('3e8a83598c3d699515f839e00afdf5e9')

_svntrunk=https://diskimagery64.svn.sourceforge.net/svnroot/diskimagery64/trunk
_svnmod=diskimagery64

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
  patch -p0 <../../trunk_cleanup.patch
  qmake
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
