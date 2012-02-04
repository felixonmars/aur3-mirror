# Contributor: Lucio Zara <pennega@gmail.com>

pkgname=plasma-konsolator-svn
pkgver=1084646
pkgrel=1
pkgdesc="A simple plasmoid embedding a konsole"
arch=('i686')
url="http://websvn.kde.org/trunk/playground/base/plasma/applets/konsolator/"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('subversion' 'cmake' 'gcc' 'automoc4')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/konsolator
_svnmod=konsolator

build() {

  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  mkdir build
  cd build
cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. 
#  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  rm -rf $startdir/src/$_svnmod-build

}

