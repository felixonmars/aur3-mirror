# Contributor: Andre Fettouhi <A.Fettouhi@gmail.com>

pkgname=devicesync
pkgver=1251122
pkgrel=1
pkgdesc="An application for transfering data between devices"
arch=('i686' 'x86_64')
url="http://www.kde.org/"
license=('GPL')
depends=('kdelibs' 'libmtp')
makedepends=('cmake' 'automoc4' 'git')
provides=('devicesync')
source=()
md5sums=()
groups=('kdemod-playground' 'kdemod-uninstall')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/utils/devicesync/
_svnmod=devicesync

build() {
  cd $startdir/src

  svn co $_svntrunk $_svnmod

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod
  
  #
  # BUILD HERE
  #

  cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1
} 
