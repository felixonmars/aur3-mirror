# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=dev9-git
pkgver=20110629
pkgrel=1
pkgdesc="A 9P replacement of udev"
arch=('i686' 'x86_64')
url="http://becquerel.org/dev9"
license=('MIT')
provides=('udev')
depends=('libduat-git' 'curie-git' 'libnl')
makedepends=('git' 'scons' 'pkg-config')
source=('rulesc.patch' 'dev9c.patch')
md5sums=('5a815402a6fb3271c65373bd1a3a0a47' 'a305b4d50d62b6c30768fbb9cd3f355a')

_gitroot=('git://git.becquerel.org/kyuba/dev9.git')
_gitname=('dev9')

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
  cd $srcdir/build
  patch src/rules.c -i $srcdir/rulesc.patch
  patch src/dev9.c -i $srcdir/dev9c.patch
}

package() {
 cd $srcdir/build
 ice -dif $pkgdir
 mkdir -p  $pkgdir/usr/share/licenses/$_gitname
 install -m644 $srcdir/$_gitname/COPYING $pkgdir/usr/share/licenses/$_gitname/COPYING
 install -m644 $srcdir/$_gitname/CREDITS $pkgdir/usr/share/licenses/$_gitname/CREDITS 
}
