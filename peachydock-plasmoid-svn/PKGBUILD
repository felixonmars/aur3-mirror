# Contributor: Nick B <Shirakawasuna at gmail dot com>

pkgname=peachydock-plasmoid-svn
pkgver=1025605
pkgrel=1
pkgdesc="A complete rewrite of PrettyTasks that eventually bring complete OS-X Dock like functionality to the KDE/Plasma Desktop. (Development tree)"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/PeachyDock?content=78494"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('subversion' 'cmake' 'gcc' 'automoc4')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/peachydock
_svnmod=peachydock

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

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR=$pkgdir/ install

  rm -r $srcdir/$_svnmod-build

}
