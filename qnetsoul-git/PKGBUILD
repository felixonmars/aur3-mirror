# Maintainer: Melvin 'Nivl' Laplanche <melvin.laplanche@epitech.eu>
pkgname=qnetsoul-git
pkgver=20130306
pkgrel=1
pkgdesc="A Qt4 netsoul client."
arch=('i686', 'x86_64')
url="http://qnetsoul.tuxfamily.org"
license=('GPL')
depends=('qt4')
makedepends=('git')
source=()
md5sums=()
provides=('qnetsoul')

_gitroot='git://git.tuxfamily.org/gitroot/qnetsoul/qnetsoul.git'
_gitname='qnetsoul'

build() {
  cd $srcdir

  msg 'Connecting to GIT server...'
  if [ -d $_gitname ]; then
     rm -Rf $_gitname
  fi
  git clone $_gitroot
}

package() {
  msg 'Buildind qnetsoul'
  cd $srcdir/$_gitname
  qmake
  make
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$_gitname/QNetSoul $pkgdir/usr/bin/
}
