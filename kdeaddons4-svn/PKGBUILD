# Contributor: Lawrence Lee <valheru@facticius.net>
pkgname=kdeaddons4-svn
pkgver=
pkgrel=1
pkgdesc="Additional plugins and scripts for some KDE4 applications"
arch=(i686)
url="http://www.kde.org/"
license=('GPL')
depends=('kdebase4-svn' 'kdepim4-svn' 'kdemultimedia4-svn' 'kdegames4-svn' 'db' 'python' 'sdl')
makedepends=('subversion' 'cmake')
provides=(kdeaddons4)
conflicts=()
replaces=()
backup=()
install=
source=()
md5sums=()
groups=(kde4)
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdeaddons
_svnmod=kdeaddons

build() {
  [ "$QTDIR" = "" ] && source /etc/profile.d/qt4.sh
  [ "$KDEDIR" = "" ] && source /etc/profile.d/kde4.sh

  # start building
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake $startdir/src/$_svnmod -DCMAKE_INSTALL_PREFIX=/opt/kde4 -DCMAKE_BUILD_TYPE=debugfull

  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1

  #clean up build directory
  rm -rf $startdir/src/$_svnmod-build
}
