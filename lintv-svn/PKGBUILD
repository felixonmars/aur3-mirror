# Contributor: Xabre <Xabre_666@operamail.com>

pkgname=lintv-svn
pkgver=1045587
pkgrel=1
pkgdesc="KDE4 Tv application"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('mplayer' 'kdelibs')
makedepends=('subversion' 'cmake' 'automoc4')
provides=('lintv')
conflicts=('lintv')
install=('lintv.install')
source=()
md5sums=()
groups=()
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/multimedia/lintv
_svnmod=lintv

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$_svnmod-build"
  mkdir "$_svnmod-build"
  cd $_svnmod-build

  cmake $startdir/src/$_svnmod -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=RELEASE

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
