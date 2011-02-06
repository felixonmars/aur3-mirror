# Contributor: bgmiki <vmikiv@gmail.com>
pkgname=kdevmon
pkgver=835924
pkgrel=4
pkgdesc="Graphics-Network-Monitor-KDE4"
arch=('i686')
url='http://www.informatik.uni-oldenburg.de/~bigboss/kdevmon/index.html'
license=('GPL')
depends=('cmake' 'automoc4' 'perl')
makedepends=('subversion')
source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/network/kdevmon
_svnmod=kdevmon
_langs=()

build() {
  svn checkout svn://anonsvn.kde.org/home/kde/trunk/playground/network/kdevmon
  cd kdevmon/
  cmake -DCMAKE_INSTALL_PREFIX=/usr/local
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
