# Maintainer: Vojtech Kral <kral.vojtech at gmail dot com>

pkgname=fog-svn
pkgver=608
pkgrel=2
pkgdesc="Fair Object Graphics library"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fog/"
license=('MIT')
makedepends=('libpng>=1.4.0' 'subversion' 'cmake')
depends=('freetype2')
provides=('fog' 'libfog')

source=()
md5sums=() 

_svntrunk=http://fog.googlecode.com/svn/trunk/
_svnmod=fog

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"

  msg "Building..."

  cd "$srcdir/$_svnmod"
  cd Fog

  # Build
  cmake . -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr -DFOG_BUILD_UISYSTEM_X11=1 -DCMAKE_BUILD_TYPE=Release -G"Unix Makefiles"
  make || return 1

  # Install
  mkdir -p ${pkgdir}/usr/
  make install || return 1
}
