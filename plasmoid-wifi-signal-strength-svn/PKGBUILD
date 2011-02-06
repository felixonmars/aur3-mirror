# Contributor: Carl Mueller  archlinux at carlm e4ward com

pkgname=plasmoid-wifi-signal-strength-svn
pkgver=1024812
pkgrel=2
pkgdesc="Kdeplasma wifi strength Plasmoid"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'subversion' 'automoc4')
conflicts=()
source=()
md5sums=()
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/wifi-signal-strength/
_svnmod=wifi-signal-strength

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

  cd $_svnmod
  
  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
 
