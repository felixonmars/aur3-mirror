# Maintainer: Zsolt Udvari <udvzsolt gmail com>

pkgname=initng-git
_gitname="initng"
pkgver=774.3d82abc
pkgrel=1
pkgdesc="A full replacement for the old System V Init system"
arch=('i686' 'x86_64')
url="http://initng.sourceforge.net/trac"
license=('GPL3')
makedepends=('git' 'acr' 'ftjam')
optdepdends=('ncurses')
options=(!strip)
source=(git://github.com/initng/${_gitname}.git
        initng-paths.h
)
md5sums=('SKIP'
         '3336bc8037273a3e007891d09967a627')

pkgver() {
    cd $_gitname
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  rm -rf $srcdir/build #start fresh
  cp -ar $srcdir/initng $srcdir/build
  cd $srcdir/build
  cp ${srcdir}/initng-paths.h .
  sed -i "s|includedir=.*|&/libinitng-@VERSION@|" initng.pc.acr
  acr
  ./configure --prefix="/usr"
  make
}

package() {
 cd $srcdir/build
 make install DESTDIR=$pkgdir
}
