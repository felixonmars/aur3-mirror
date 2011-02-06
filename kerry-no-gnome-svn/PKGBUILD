# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=kerry-no-gnome-svn
pkgver=877573
pkgrel=1
pkgdesc="Kerry from SVN without beagle's heavy Gnome dependencies"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdepimlibs' 'kdelibs' 'beagle-no-gnome' 'libbeagle-no-gnome')
makedepends=('cmake' 'subversion')
conflicts=('kerry')
provides=('kerry')
groups=()
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/extragear/utils/kerry
_svnmod=kerry

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake $startdir/src/$_svnmod -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release

  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1

  rm -rf $startdir/src/$_svnmod-build
}
