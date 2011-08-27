# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kmobiletools-svn
pkgver=1164730
pkgrel=1
pkgdesc="Make you mobile phone communicate with your PC"
url="http://kmobiletools.org"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-runtime' 'kdepimlibs' 'gammu')
makedepends=('cmake' 'automoc4' 'subversion' 'boost')
install=kmobiletools.install
source=()
md5sums=()

_svntrunk=svn://websvn.kde.org/home/kde/trunk/playground/pim/kmobiletools/
_svnmod=kmobiletools

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir build
  cd build
  cmake ../$_svnmod \
    -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build
  make DESTDIR=$pkgdir install
}
