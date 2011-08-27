# Contributor: Yvan <madridista40@orange.fr>

pkgname=libogc-svn
pkgver=3719
pkgrel=1
pkgdesc="Library for Nintendo Gamecube/Wii development."
url="http://www.devkitpro.org/"
license=('GPL')
arch=('i686')
depends=('devkitppc')
makedepends=('subversion')
conflicts=('libogc' 'libogc-git')
replaces=('libogc' 'libogc-git')
source=()
md5sums=()

_svntrunk=https://devkitpro.svn.sourceforge.net/svnroot/devkitpro/trunk/libogc/
_svnmod=libogc

build() {
  cd $startdir/src

  svn co $_svntrunk -r $pkgver $_svnmod

  cd $_svnmod

  msg "Starting build..."

  export DEVKITPRO=${pkgdir}/opt/devkitpro
  export DEVKITPPC=$DEVKITPRO/devkitPPC
  make || return 1
  mkdir -p $DEVKITPRO

  make install

  install -Dm644 ${srcdir}/$_svnmod/libogc_license.txt  \
  ${pkgdir}/usr/share/licenses/${pkgname}/libogc_license.txt
}


