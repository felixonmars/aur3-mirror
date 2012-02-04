# Contributor: Team Pantheon <maintainer@team-pantheon.de>

pkgname=ogrenewt-pantheon
pkgver=4950
pkgrel=1
pkgdesc="Wrapper library for Newton SDK into Ogre engine; patched by Pantheon"
url="http://walaber.com/index.php?action=showitem&id=9"
arch=('i686' 'x86_64')
license=('unrestricted')
depends=('boost' 'newton-dynamics-beta' 'ogre')
makedepends=('cmake' 'subversion')
conflicts=('ogrenewt' 'ogrenewt-cvs')
provides=('ogrenewt')

source=()
md5sums=()

_svntrunk=http://svn.berlios.de/svnroot/repos/dsa-hl/dependencies/OgreNewt
_svnmod=OgreNewt

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
