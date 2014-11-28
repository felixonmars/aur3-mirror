# Contributor: Team Pantheon <maintainer@team-pantheon.de>

pkgname=rastullah-svn
pkgver=4865
pkgrel=5
pkgdesc="A modular game engine for a 3rd-person roleplaying game"
url="http://www.rastullahs-lockenpracht.de"
arch=('i686' 'x86_64')
license=('custom:ClarifiedArtistic')
depends=('boost' 'cegui' 'fmodex' 'freeimage' 'meshmagick-svn' 'newton-dynamics-beta>=2.00' 'nvidia-cg-toolkit' 'ogre>=1.6' 'ogrenewt-pantheon' 'ois' 'ruby' 'swig' 'xerces-c-2')
makedepends=('cmake' 'subversion')
optdepends=('rastullah-modules-svn: game modules')
conflicts=('rastullah')
provides=('rastullah')

source=()
md5sums=()

_svntrunk=http://svn.berlios.de/svnroot/repos/dsa-hl/rl/trunk
_svnmod=rastullah

build() {

  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod
    svn up -r $pkgver || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
    cd $_svnmod
  fi

  msg "SVN checkout done."

  mkdir -p build
  cd build
  cmake -DXERCESC_INCLUDE_DIR=/opt/xerces-c-2/include \
    -DXERCESC_LIBRARY=/opt/xerces-c-2/lib/libxerces-c.so \
    -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -m 755 $startdir/rastullahstart.sh $pkgdir/usr/bin/rastullahstart

  mkdir -p $pkgdir/usr/share/licenses/rastullah
  install -m 644 $srcdir/$_svnmod/LICENSE.TXT $pkgdir/usr/share/licenses/rastullah/
  install -m 644 $srcdir/$_svnmod/LICENSE_PROGRAM.TXT $pkgdir/usr/share/licenses/rastullah/

  msg "Game engine installation done."
  msg "Install 'rastullah-modules-svn' for game modules."
}
# vim:syntax=sh
