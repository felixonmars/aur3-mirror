# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=gnelib-svn
pkgver=663
pkgrel=1
pkgdesc="A cross-platform, multithreaded, C++ networking library specifically designed for game networking."
arch=('i686' 'x86_64')
url="http://www.gillius.org/gne"
license=('LGPL')
depends=('hawknl' 'boost')
makedepends=('cmake')
provides=('gnelib')
conflicts=('gnelib')
source=()
md5sums=()

_svntrunk=https://gnelib.svn.sourceforge.net/svnroot/gnelib/trunk
_svnmod=gnelib

build() {
  cd "${srcdir}"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r ${pkgver})
  else
    svn co $_svntrunk --config-dir ./ -r ${pkgver} $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/$_svnmod-build"
  cp -r "${srcdir}/$_svnmod" "${srcdir}/$_svnmod-build"
  cd "${srcdir}/$_svnmod-build"

  sed -i 's/usr\/local/usr/' CMakeLists.txt
  cmake .
  make || return 1
  make DESTDIR="${pkgdir}/" install
}
