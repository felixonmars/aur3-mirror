# Contributor: Flamelab <panosfilip@gmail.com>

pkgname=kiosktool-svn
pkgver=984348
pkgrel=1
pkgdesc="A Point&Click tool for system administrators to enable KDE's KIOSK features or otherwise preconfigure KDE for groups of users."
arch=('i686' 'x86_64')
url="http://websvn.kde.org/trunk/extragear/sysadmin/kiosktool/"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
provides=('kiosktool')
conflicts=('kiosktool')

source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/extragear/sysadmin/kiosktool
_svnmod=kiosktool

build() {

  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .. || return 1
  make  || return 1
  make DESTDIR=${pkgdir} install
  
  msg "Cleaning up..."
  rm -rf ${srcdir}/${_svnmod}-build
}
