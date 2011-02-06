# Contributor: Panagiotis Papadopoulos <pano_90 AT gmx DOT net> 
pkgname=rbutil-svn
pkgver=24596
pkgrel=1
pkgdesc='A Qt application for easily managing your Rockbox installation.'
arch=('i686' 'x86_64')
url='http://www.rockbox.org/twiki/bin/view/Main/RockboxUtility'
license=('GPL')
depends=('qt>=4.3.0' 'libusb')
provides=('rbutilqt' 'rbutil')
conflicts=('rbutilqt' 'rbutilqt-svn' 'rbutil')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=svn://svn.rockbox.org/rockbox/trunk
_svnmod=rbutil

build() {
  msg "Connecting to $_svnmod SVN server...."
  svn co $_svntrunk/$_svnmod $_svntrunk/apps $_svntrunk/tools $_svnmod
  [ -d ./$_svnmod-build ] && rm -fr ./$_svnmod-build
  cp -r ./$_svnmod ./$_svnmod-build
  cd ./$_svnmod-build
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  svn update
  cd rbutil
  qmake || return 1
  make || return 1
  install -Dm755 rbutilqt/rbutilqt $pkgdir/usr/bin/rbutilqt
}

