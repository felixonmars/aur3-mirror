# Contributor: Yvan <madridista40@orange.fr>

pkgname=libfat-ogc-svn
pkgver=3608
pkgrel=1
pkgdesc="Library for acessing fat filesystems on Nintendo Gamecube/Wii homebrews."
url="http://www.devkitpro.org/"
license=('GPL')
arch=('i686')
depends=('devkitppc' 'libogc-svn')
makedepends=('subversion')
conflicts=('libfat-ogc')
replaces=('libfat-ogc')
source=()
md5sums=()

_svntrunk=https://devkitpro.svn.sourceforge.net/svnroot/devkitpro/trunk/libfat/
_svnmod=libfat

build() {
  cd $startdir/src

  svn co $_svntrunk -r $pkgver $_svnmod

  cd $_svnmod

  msg "Starting build..."

  make ogc-release || return 1

  export DEVKITPRO=${pkgdir}/opt/devkitpro
  mkdir -p $DEVKITPRO/libogc/lib/{cube,wii}
  mkdir -p $DEVKITPRO/libogc/include
  mkdir -p $DEVKITPRO

  make ogc-install
}


