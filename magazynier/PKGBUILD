# Maintainer: nqn1976 @ gmail.com

pkgname=magazynier
_svnrel=1134800
pkgver=0.9svn${_svnrel}
pkgrel=1
pkgdesc="A sokoban game for KDE"
arch=('i686' 'x86_64')
url="http://websvn.kde.org/trunk/playground/games/magazynier/"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'subversion')

build() {
  cd ${srcdir}
  svn co svn://anonsvn.kde.org/home/kde/trunk/playground/games/magazynier -r ${_svnrel}
  cd ${pkgname}
  mkdir build || return 1
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}