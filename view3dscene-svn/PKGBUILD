# Contributor: Antonio Bonifati ant hat venus deis unical it
# Maintainer: Antonio Bonifati ant hat venus deis unical it
# $Id$

pkgname=view3dscene-svn
pkgver=11434
pkgrel=3
pkgdesc="VRML, X3D, 3d Studio 3DS, Collada, MD3, Wavefront OBJ tiny fast browser and viewer"
url="http://vrmlengine.sourceforge.net/view3dscene.php"
arch=('i686' 'x86_64')
license=('GPL')
install=view3dscene.install
depends=(gtkglext)
makedepends=(subversion fpc)

source=()
md5sums=()

_svntrunk=svn://svn.code.sf.net/p/castle-engine/code/trunk
_svnmod=(castle_game_engine view3dscene)

build() {
  cd ${srcdir}

  local mod
  for mod in ${_svnmod[@]}; do
    if [ -d $mod/.svn ]; then
      (cd $mod && svn up -r $pkgver)
    else
      svn co $_svntrunk/$mod --config-dir ./ -r $pkgver
    fi
  done

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir build
  cp -r ${_svnmod[@]} build
  cd build/${_svnmod[1]}

  ./compile.sh

  install -D -m755 view3dscene ${pkgdir}/usr/bin/view3dscene

  # desktop integration
  install -D -m644 desktop/view3dscene.desktop ${pkgdir}/usr/share/applications/view3dscene.desktop
  install -D -m644 desktop/view3dscene.svg ${pkgdir}/usr/share/pixmaps/view3dscene.svg
  install -D -m644 desktop/view3dscene.xml ${pkgdir}/usr/share/mime/packages/view3dscene.xml

  rm -rf ${srcdir}/build
}

# vim:set ts=2 sw=2 et:
