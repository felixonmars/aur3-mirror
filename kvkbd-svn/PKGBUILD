# Contributor: bgmiki <bgmiki@gmail.com>
pkgname=kvkbd-svn
pkgver=861568
pkgrel=1
pkgdesc="virtual keyboard for KDE4"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdelibs' 'libxtst' 'cmake')
makedepends=('subversion')
source=()
md5sums=()
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/utils/kvkbd
_svnmod=kvkbd-svn

build() {
  # start building
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  mkdir -p $_svnmod-build
  cd $_svnmod-build

  cmake $startdir/src/$_svnmod -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELWITHDEBINFO

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  #clean up build directory
  rm -rf $startdir/src/$_svnmod-build
}
