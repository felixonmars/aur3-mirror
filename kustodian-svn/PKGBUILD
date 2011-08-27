# Contributor: Rasi <rasi13@gmx.de>

pkgname=kustodian-svn
pkgver=1009124
pkgrel=1
pkgdesc="A Dock for KDE."
url="http://kdevelopers.org/node/4038"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-runtime' 'kdelibs')
makedepends=('subversion' 'cmake' 'automoc4')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/kustodian
_svnmod=kustodian

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make  || return 1
  make DESTDIR=$pkgdir install

  rm -rf $srcdir/$_svnmod-build
}
