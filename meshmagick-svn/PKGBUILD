# Contributor: Team Pantheon <maintainer@team-pantheon.de>

pkgname=meshmagick-svn
pkgver=2661
pkgrel=3
pkgdesc="Command-line tool for manipulating meshes"
url="http://www.ogre3d.org/"
arch=('i686' 'x86_64')
license=('LGPL2')
depends=('ogre')
makedepends=('cmake' 'subversion')
conflicts=('meshmagick')
provides=('meshmagick')

source=()
md5sums=()

_svntrunk=https://ogreaddons.svn.sourceforge.net/svnroot/ogreaddons/trunk/meshmagick
_svnmod=meshmagick

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
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

}
# vim:syntax=sh
