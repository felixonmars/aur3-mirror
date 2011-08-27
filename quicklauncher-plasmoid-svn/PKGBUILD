# Contributor: Nick B <Shirakawasuna at gmail dot com>

pkgname=quicklauncher-plasmoid-svn
pkgver=1007244
pkgrel=1
pkgdesc="A plasmoid that implements a quicklaunch applet. (Development tree)"
arch=('i686')
url="http://www.kde-look.org/content/show.php/QuickLauncher+Applet?content=78061"
license=('GPL2')
depends=('kdelibs')
makedepends=('automoc4' 'subversion' 'cmake' 'gcc')
provides=('quicklauncher-plasmoid')
conflicts=('quicklaunhcer-plasmoid')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdebase/workspace/plasma/applets/quicklaunch
_svnmod=quicklauncher

build() {

  cd $srcdir

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
  make DESTDIR=$pkgdir install

  rm -rf $srcdir/$_svnmod-build

}
