# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=libduat-git
pkgver=20110629
pkgrel=1
pkgdesc="An I/O library for C applications to implement FS servers"
arch=('i686' 'x86_64')
url="http://becquerel.org/libduat"
license=('MIT')
provides=('libduat')
depends=('curie-git')
makedepends=('git')

_gitroot=('git://git.becquerel.org/kyuba/duat.git')
_gitname=('libduat')

build() {
 cd $srcdir

   if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  rm -rf $srcdir/build
  cp -ar $srcdir/$_gitname $srcdir/build
}

package() {
 cd $srcdir/build
 ice -dif $pkgdir/usr
 mkdir -p  $pkgdir/usr/share/licenses/$_gitname
 install -m644 $srcdir/$_gitname/COPYING $pkgdir/usr/share/licenses/$_gitname/COPYING
 install -m644 $srcdir/$_gitname/CREDITS $pkgdir/usr/share/licenses/$_gitname/CREDITS 
}
